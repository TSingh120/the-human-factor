function controlsetup()
{
	buffertime = 3;
	
	jumpkey_buffered = false;
	jumpkey_buffertimer= 0;
	
}

function getcontrols()
{
	//Directional inputs
	rightkey = keyboard_check(ord("D"))
	rightkey = clamp(rightkey, 0, 1);
	leftkey = keyboard_check(ord("A"))
	leftkey = clamp(leftkey, 0, 1);
	
	//Action Inputs
	jumpkey_pressed = keyboard_check_pressed(ord("W"))
		jumpkey_pressed = clamp(jumpkey_pressed, 0, 1);
	jumpkey = keyboard_check(ord("W"))
		jumpkey = clamp(jumpkey, 0, 1);
	dashkey_pressed = keyboard_check_pressed(ord("J"));
		dashkey_pressed = clamp(dashkey_pressed, 0, 1);
		
		//Jump key buffering
		if jumpkey_pressed
		{
			jumpkey_buffertimer = buffertime;
		}
		if jumpkey_buffertimer > 0
		{
			jumpkey_buffered = 1;
			jumpkey_buffertimer--;
		}
		else {
			jumpkey_buffered = 0;
		}			
		//Dashing
		if (dashkey_pressed) && (dash_cooldown <= 0)
		{
			dash_duration = 10;
			dash_cooldown = 30;
		}
}

		