//get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//move through the menu
pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length - 1};

//using the options
if accept_key{
	switch(pos){
	
		case 0:
			room_goto_next();
			break;
		
		//settings
		case 1:
		
			break;
		
		//credits
		case 2:
	
			break;
		
		//quit game
		case 3:
			game_end();
			break;
	
	
	}
}
