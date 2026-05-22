//Get inputs
getcontrols();

//X movement
	//Direction

	move_dir = rightkey - leftkey;

	//Get xspeed

	x_speed = move_dir * move_speed;

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
	y_speed += gravity_speed;
	
	//Cap falling speed
	if y_speed > term_vel { y_speed = term_vel;	};
	
	//resetting jumping
	if (on_ground){
		jump_count = 0;	
	}
	else {
		//to make the player only be able to jump once in the air, even if theyre falling off a ledge
		if jump_count == 0 { jump_count = 1; }
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
		jump_hold_timer = jump_hold_frames;
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
		y_speed = jump_speed;
		//Count down the jump timer thing
		jump_hold_timer--;
	}
	
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
		
		//Set y speed 0 to collide
		y_speed = 0;
	}
	
	//Check grounded state
	if y_speed >= 0 && place_meeting(x, y+1, obj_wall)
	{
		on_ground = true;	
	}
	else {
		on_ground = false;
	}
	
	//Move
	y += y_speed;
	






































