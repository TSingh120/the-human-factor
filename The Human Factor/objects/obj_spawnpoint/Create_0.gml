if keyboard_check_pressed(ord("R")) && instance_exists(obj_player) 
	{
	room_restart();
	obj_player.hp = 100;
	obj_player.x = x;
	obj_player.y = y;
	}

