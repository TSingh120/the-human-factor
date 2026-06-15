if (obj_player.y > room_height + 50 || obj_player.y < -room_height - 50) || (obj_player.x > room_width + 50 || obj_player.y < -room_width - 50) {
	room_restart();
	obj_player.hp = 100;
	obj_player.x = x;
	obj_player.y = y;
}

if obj_player.hp <= 0 {
	room_restart();
	obj_player.hp = 100;
	obj_player.x = x;
	obj_player.y = y;
	
}
































