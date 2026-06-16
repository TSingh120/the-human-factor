var _s = id;

if position_meeting(mouse_x, mouse_y, id) && !instance_exists(obj_textbox) && mouse_check_button_pressed(mb_left)
{
	create_textbox(_s.text_id);
}
