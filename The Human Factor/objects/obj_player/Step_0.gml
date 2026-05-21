//Get inputs


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
	
	//Jumping
	if jumpkey_pressed && place_meeting(x, y+1, obj_wall)
	{
		y_speed = jump_speed;
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
	
	//Move
	y += y_speed;
	






































