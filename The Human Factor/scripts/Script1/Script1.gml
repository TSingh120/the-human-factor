function getcontrols()
{
	//Directional inputs
	rightkey = keyboard_check(vk_right);
	leftkey = keyboard_check(vk_left);
	//Action Inputs
	jumpkey_pressed = keyboard_check_pressed(vk_up);
}