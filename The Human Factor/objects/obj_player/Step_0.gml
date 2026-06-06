//Get inputs
getcontrols();
//get hitbox combat info
event_inherited();

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
	slide_duration--;
	slide_cooldown--;
	if iframes > 0 {iframes--;};
	
	if (wall_jump_timer > 0)
	{
		// Lock steering while wall jumping momentum carries the player
		wall_jump_timer--;
	} 
	else if (dash_duration > 0)
	{
		x_speed = facing_dir * dash_speed;
		y_speed = 0;
	}
	else if (slide_duration > 0)
	{
		x_speed = move_dir * slide_speed;
	}
	else {
		x_speed = move_dir * move_speed;
	}

	//x collisions

	var _subpixel = 0.5;
	if place_meeting(x+ x_speed, y, obj_wallmy)
	{
		//Scoot up to wall precisely
		var _pixelcheck = _subpixel * sign(x_speed);
		while !place_meeting(x + _pixelcheck, y , obj_wallmy)
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
	
	//Wall sliding and jumping
	var _onwall_left = place_meeting(x - 1, y, obj_wallmy);
	var _onwall_right = place_meeting(x + 1, y, obj_wallmy);
	var _onwall = _onwall_left || _onwall_right
	
		//Wall sliding
		if (_onwall && !on_ground && y_speed > 0){
			if (y_speed > wall_slide_speed){
				y_speed = wall_slide_speed;	
			}
		}
		
		//Wall jumping
		if (jumpkey_buffered && _onwall && !on_ground)
		{
			jumpkey_buffered = false;
			jumpkey_buffertimer = 0;
			
			//Apply wall jump force
			y_speed = wall_jump_vsp;
			
			if (_onwall_left) {
				x_speed = wall_jump_hsp;
			}
			else {
				x_speed = -wall_jump_hsp;
			}
			
			// Lock controls temporarily
			wall_jump_timer = wall_jump_control_loss;
		
			// Reset the variable jump timer so it doesn't float weirdly
			jump_hold_timer = 0; 
		}
		
	
	//Starting the Jumping
	if jumpkey_buffered && jump_count < jump_max && (on_ground || !_onwall)
	{
		//Reset buffer
		jumpkey_buffered = false;
		jumpkey_buffertimer = 0;		
		//set jump count higher for each jump
		jump_count++;	
		sprite_index = jump_sprite;
		image_index = 0;
		image_speed = 1;
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
	
	
	//Y Collision
	var _subpixel = 0.5;
	if place_meeting(x, y + y_speed, obj_wallmy)
	{
		//Scoot up to the wall precisely
		var _pixelcheck = _subpixel * sign(y_speed);
		while !place_meeting(x, y + _pixelcheck, obj_wallmy)
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
	if y_speed >= 0 && place_meeting(x, y+1, obj_wallmy)
	{
		setonground(true);
	}
	
	//Move
	y += y_speed;
	
//Combat stuff
//State machine manager thing
if (state == "stunned") {
	action_timer--;
	x_speed = 0;
	y_speed = 0;
	dash_duration = 0;
	dash_cooldown = action_timer;
	slide_cooldown = action_timer;
	if action_timer > 0 { move_speed = 0; }
	else { move_speed = 4 }
	if (action_timer <= 0) { state = "idle" };
}
else if  (state == "winding") {
	//frames where the entity can be parried or countered
	action_timer--;
	if action_timer <= 0 {
		//winding finished, spawn hitbox
		state = "idle";
		var _hitbox = instance_create_layer(x + (facing_dir * 8), y - 20 , "Instances", obj_hitbox);
		_hitbox.owner = id;
		_hitbox.type = "attack";
		_hitbox.image_xscale = facing_dir;
		_hitbox.lifetime = 10;
		//actually attack
		state = "attacking"; 
		action_timer = 20; // 20 frames of follow-through swing
		image_index = 0;   // Reset animation for the swing
	}
}
else if (state == "attacking")
{
	//Wait for the swing to finish before returning to idle
	action_timer--;
	if (action_timer <= 0) state = "idle";
}
else if state == "blocking" {
	//waiting for the block duration to end
	action_timer--;
	if (action_timer <= 0) state = "idle";
}
else if state == "idle" {
	//begin attack 
	if (attackkey_pressed)
	{
		state = "winding";
		action_timer = 8;
		image_index = 0;
		
	}
	//blocking
	if (blockkey_pressed)
	{
		state = "blocking";
		action_timer = 40;
		image_index = 0;
		var _blockbox = instance_create_layer(x + (facing_dir * 8), y - 20 , "Instances", obj_hitbox);
		_blockbox.owner = id;
		_blockbox.type = "block";
		_blockbox.lifetime = 40;
		_blockbox.image_xscale = facing_dir;
		
	}
}
	

	
//Sprite control
	//Walking
	if !on_ground && !_onwall && !dash_duration > 0
{
    if sprite_index != jump_sprite
    {
        sprite_index = jump_sprite;
        image_index = 0;
    }
}
else if _onwall && !on_ground
{
    sprite_index = wall_sprite;
}
else if dash_duration > 0
{
    sprite_index = dash_sprite;
}
else if abs(x_speed) > 0
{
    sprite_index = walk_sprite;
}
else
{
    sprite_index = idle_sprite;
}
	if slide_duration > 0 {
		sprite_index = slide_sprite;
		mask_index = slidemask_sprite;
		if image_index = 0 { image_index += 1 }
	} else {
		//Collision Mask
		mask_index = mask_sprite;
	}
	switch (state) 
{		
	case "winding":
		sprite_index = spr_playerwinding;
		break;
		
	case "attacking":
		sprite_index = spr_playerattack;
		break;
		
	case "blocking":
		sprite_index = spr_playerblock;
		break;
		
	case "stunned":
		sprite_index = spr_playerstunned;
		break;
}
	
	
//If outside the room
if (obj_player.y > room_height + 50 || obj_player.y < -room_height - 50) || (obj_player.x > room_width + 50 || obj_player.y < -room_width - 50) {
	room_restart();	
}

if hp <= 0 {
	room_restart();	
}

if keyboard_check_pressed(ord("M")) {
	room_goto(0);	
}