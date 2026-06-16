//get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move through the menu
pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length - 1};

//using the options
if accept_key{
	var _sml = menu_level;
	switch(menu_level){
		//Starting
		case 0 : switch(pos){
					//Play
					case 0: room_goto_next(); 
					break;
					//settings
					case 1: menu_level = 1;
					break;
					//credits
					case 2: menu_level = 2;
					break;
					//quit game
					case 3: game_end();
					break;
					
					case 4:
					break;
				}
				break;
		//settings 
		case 1 : switch(pos){
					//music volume
					case 0:  
					break;
					//sfx volume
					case 1:
					break;
					//toggle shaders
					case 2:
					break;
					//back to the main starting menu
					case 3: menu_level = 0;
					break;
				}
				
			case 2 : switch(pos){
					//music volume
					case 0:  
					break;
					//sfx volume
					case 1:
					break;
					//toggle shaders
					case 2:
					break;
					//back to the main starting menu
					case 3:
					break;
					
					case 4: menu_level = 0;
					break;
				}
	}
	
	//Set postion back to 0 for every menu change
	if _sml != menu_level {pos = 0};
	
	//correct option length
	op_length = array_length(option[menu_level]);
	
}
