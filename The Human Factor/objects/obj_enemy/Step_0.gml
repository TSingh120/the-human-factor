event_inherited();

if (state == "idle") {
	//checking to find the player and chasing if the player is close enough
	if instance_exists(obj_player) 
	{
		if point_distance(x, y, obj_player.x, obj_player.y) <= detection_range 
		{
			move_dir = sign(obj_player.x - x);
		
			// If player is  moving left or right update the facing direction
			if (move_dir != 0) 
			{
				facing_dir = move_dir;
			}
		
			x_speed = move_dir * move_speed;
		}
		else 
		{ 
			x_speed = 0; 
		}
	
	if (point_distance(x, y, obj_player.x, obj_player.y) <= 40) {
		state = "winding";
		action_timer = 8;
		image_index = 0;
		x_speed = 0;
		}	
	}
}
else if state == "winding" {
	action_timer--;
	if action_timer <= 0 {
			//winding finished, spawn hitbox
		var _hitbox = instance_create_layer(x + (facing_dir * 20), y - 20 , "Instances", obj_hitbox);
		_hitbox.owner = id;
		_hitbox.type = "attack";
		_hitbox.image_xscale = facing_dir;
		//actually attack
		state = "attacking"; 
		action_timer = 60; // 10 frames of follow-through swing
		image_index = 0;   // Reset animation for the swing
	}
}
else if (state == "attacking") 
{
	action_timer--;
	if (action_timer <= 0) state = "idle";
}
else if (state == "stunned") 
{
	action_timer--;
	if (action_timer <= 0) state = "idle";
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

//Apply gravity to the player
		y_speed += gravity_speed;
		if y_speed > term_vel { y_speed = term_vel;	};
		
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
		on_ground = (true);
	}
	
	//Move
	y += y_speed;
	
	image_xscale = facing_dir;
	
		switch (state) 
{		
	case "winding":
		sprite_index = spr_enemywinding;
		break;
		
	case "attacking":
		sprite_index = spr_enemyattack;
		break;
		
	case "blocking":
		sprite_index = spr_enemyblock;
		break;
		
	case "stunned":
		sprite_index = spr_enemystunned;
		break;
		
	case "idle":
		sprite_index = spr_enemy;
		break;
}
	
	if hp <= 0 {
		instance_destroy();	
	}