//Get inputs
getcontrols();

//X movement
	//Dashing (hopefully this works)

	//Direction
	if (dash_duration) <= 0 {
	move_dir = rightkey - leftkey;
	}
	//Get which direction to face
	if move_dir != 0 { facing_dir = move_dir; };

	//Get xspeed

	dash_duration--;
	dash_cooldown--;
	
	if (dash_duration > 0)
	{
		x_speed = facing_dir * dash_speed;
		y_speed = 0;
	} else {
		x_speed = move_dir * move_speed;
	}

	//x collisions

	var _subpixel = 0.5;
	if place_meeting(x+ x_speed, y, obj_wall)
	{
		//Scoot up to wall precisely
		var _pixelcheck = _subpixel * sign(x_speed);
		while !place_meeting(x + _pixelcheck, y , obj_wall)
		{
			x += _pixelcheck;
		}
		
		//Set x speed to 0 to collide
		x_speed = 0;
	}

	//Move
	x += x_speed;

//Y movement

	//Gravity
	if coyote_hangtimer > 0
	{
		//Count the timer down
		coyote_hangtimer--;
	} else {
		//Apply gravity to the player
		y_speed += gravity_speed;
		//No longer on the ground or the extension
		setonground(false);
	}
	
	//Cap falling speed
	if y_speed > term_vel { y_speed = term_vel;	};
	
	//resetting/preparing jumping
	if (on_ground){
		jump_count = 0;
		coyote_jumptimer = coyote_jumpframes;
	}
	else {
		//to make the player only be able to jump once in the air, even if theyre falling off a ledge
		coyote_jumptimer--;
		if jump_count == 0 && coyote_jumptimer <= 0 { jump_count = 1; }
	}
	
	//starting the Jumping
	if jumpkey_buffered && jump_count < jump_max
	{
		//Reset buffer
		jumpkey_buffered = false;
		jumpkey_buffertimer = 0;		
		//set jump count higher for each jump
		jump_count++;		
		//Set jump hold timer to equal to the number of frames in the jump frames code
		jump_hold_timer = jump_hold_frames[jump_count - 1];
		//Tell the player that they're no longer on the ground
		setonground(false);
	}
	//Cut off the jump by releasing the jump button
	if !jumpkey
	{
		jump_hold_timer = 0;	
	}
	//Jumping based on how long the key is held
	if jump_hold_timer > 0 
	{
		//Constantly set the y speed to be the jumping speed
		y_speed = jump_speed[jump_count - 1];
		//Count down the jump timer thing
		jump_hold_timer--;
	}
	
	//Wall sliding and jumping
	
	
	//Y Collision
	var _subpixel = 0.5;
	if place_meeting(x, y + y_speed, obj_wall)
	{
		//Scoot up to the wall precisely
		var _pixelcheck = _subpixel * sign(y_speed);
		while !place_meeting(x, y + _pixelcheck, obj_wall)
		{
			y += _pixelcheck;
		}
		
		//Bonk code 
		if y_speed < 0
		{
			jump_hold_timer = 0;	
		}
		
		//Set y speed 0 to collide
		y_speed = 0;
	}
	
	//Check grounded state
	if y_speed >= 0 && place_meeting(x, y+1, obj_wall)
	{
		setonground(true);
	}
	
	//Move
	y += y_speed;
	
//Sprite control
	//Walking
	if abs(x_speed) > 0 {sprite_index = walk_sprite; };
	//Not moving
	if x_speed == 0 {sprite_index = idle_sprite};
	//Jumping
	if !on_ground {sprite_index = jump_sprite};
	//Dashing
	if dash_duration > 0 {sprite_index = dash_sprite};
	
		//Collision Mask
		mask_index = mask_sprite;

