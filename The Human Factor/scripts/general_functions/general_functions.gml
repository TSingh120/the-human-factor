function controlsetup()
{
	buffertime = 3;
	
	jumpkey_buffered = false;
	jumpkey_buffertimer= 0;
	
}

function getcontrols()
{
	//Directional inputs
	rightkey = keyboard_check(ord("D")) + keyboard_check(vk_right);
	rightkey = clamp(rightkey, 0, 1);
	leftkey = keyboard_check(ord("A")) + keyboard_check(vk_left);
	leftkey = clamp(leftkey, 0, 1);
	
	//Action Inputs
	jumpkey_pressed = keyboard_check_pressed(ord("W")) + keyboard_check(vk_up);
		jumpkey_pressed = clamp(jumpkey_pressed, 0, 1);
	jumpkey = keyboard_check(ord("W")) + keyboard_check(vk_up);
		jumpkey = clamp(jumpkey, 0, 1);
		
		//Jump key buffering
		if jumpkey_pressed
		{
			jumpkey_buffertimer = buffertime;
		}
		if jumpkey_buffertimer > 0
		{
			jumpkey_buffered = true;
			jumpkey_buffertimer--;
		}
		else {
			jumpkey_buffered = 0;
		}			
}