accept_key = keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 270;

//Setup
if setup == false 
{
	
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through the pages
	for(var p = 0; p < page_number; p++)
		{
		//Find how many characters are on each page and store that number in the "text_length" array
		text_length[p] = string_length(text[p]);
		
		//Get the x position for the textbox
			//Character on the left side
			text_x_offset[p] = 144;
			portrait_x_offset[p] = 32;
			//If character on the right
			if speaker_side[p] == -1 {
				text_x_offset[p] = 32;
				portrait_x_offset[p] = 544;
			}			
			//If there are no characters, center the textbox
			if speaker_sprite[p] == noone {
				text_x_offset[p] = 128;
			}
			
		//Setting individual characters and finding where the lines of text should break
		for (var c = 0; c < text_length[p]; c++)
			{
				
				var _char_pos = c + 1;
				
				//Store individual characters in the "char" array
				char[c, p] = string_char_at(text[p], _char_pos);
				
				//Get current iwdth of the line that we're typing
				var _text_up_to_char = string_copy(text[p], 1, _char_pos);
				var _current_text_width = string_width(_text_up_to_char) - string_width(char[c, p]);
				
				//Get the last free space
				if char[c, p] == " " {last_free_space = _char_pos + 1 }
				
				//Get the line breaks
				if _current_text_width - line_break_offset[p] > line_width
					{
						
						line_break_pos[line_break_num[p], p] = last_free_space;
						line_break_num[p]++;
						var _text_up_to_last_space = string_copy(text[p], 1, last_free_space);
						var _last_free_space_string = string_char_at(text[p], last_free_space);
						line_break_offset[p] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string);
						
					}
				
			}
			
			//Getting each character's coordinate
			for (var c = 0; c < text_length[p]; c++)
			{
				
				var _char_pos = c + 1;
				var _text_x = textbox_x + text_x_offset[p] + border;
				var _text_y = textbox_y + border;
				//Get current width of the line that we're typing
				var _text_up_to_char = string_copy(text[p], 1, _char_pos);
				var _current_text_width = string_width(_text_up_to_char) - string_width(char[c, p]);
				var _text_line = 0;
				
				//Compensate for string breaks
				for (var lb = 0; lb < line_break_num[p]; lb++;)
					{
					
						//If the current looping character is after a line break
						if _char_pos >= line_break_pos[lb, p]
							{
							
							var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p]);
							_current_text_width = string_width(_str_copy);
							
							//Record the "line" this character should be on
							_text_line = lb+1;	//+1 since lb starts at 0
							
							}
					
					}
					
					//Add to the x and y coords based on the new info
					char_x[c, p] = _text_x + _current_text_width;
					char_y[c, p] = _text_y + _text_line*line_sep;
				
			}
		
		}
		//Voice lines
		 if (voice_line[0] != noone)
		{
        current_voice = audio_play_sound(voice_line[0], 10, false);
		}
	
}



//Typing the text
if text_pause_timer <= 0 
{
if draw_char < text_length[page] 
	{
		draw_char += text_speed;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if _check_char == "." || _check_char == "?" || _check_char == ","
			{
				
				text_pause_timer = text_pause_time;
				if !audio_is_playing(snd[page]) {
				audio_play_sound(snd[page], 8, false);
				}
				
			} 
			else 
				{
				
					//Typing sound
					if snd_count < snd_delay {
						snd_count++;	
					}
						else {
							snd_count = 0;
							audio_play_sound(snd[page], 8, false);
						}
				
				}
	}
}
else {
	text_pause_timer--;	
}

//Move through the pages
if accept_key
{
		//If the typing is done, go to the next page
		if draw_char == text_length[page]
		{
			//Next page
			if page < page_number - 1
			{
				page++;
				draw_char = 0;
				// Stop the playing one and play the next voice line
				if (current_voice != noone) { audio_stop_sound(current_voice); }
				if (voice_line[page] != noone) 
					{
						current_voice = audio_play_sound(voice_line[page], 10, false);
					}
			}
			//Destroying/Exiting the textbox once out of pages
			else 
			{
				//Link text to the option selected
				if option_number > 0 
				{
					create_textbox(option_link_id[option_pos]);	
				}
				if (current_voice != noone) { audio_stop_sound(current_voice) }
				instance_destroy();
			}
		}
		//If the whole dialogue for the page hasnt been typed out yet
		else 
			{
		draw_char = text_length[page];	
			}
	
}

//Draw the textbox itself
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
textbox_image += textbox_image_speed;
textbox_sprite_width = sprite_get_width(textbox_sprite[page]);
textbox_sprite_height = sprite_get_height(textbox_sprite[page]);

//Draw the speaker or character
if speaker_sprite[page] != noone{
	
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] { image_index = 0 };
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1 { _speaker_x += sprite_width }   //Can change the sprite width to the width of the sprite in numerical values if need be
	//Draw the sprite for the speaker
	draw_sprite_ext(textbox_sprite[page], textbox_image, textbox_x + portrait_x_offset[page], textbox_y, 96/textbox_sprite_width, 96/textbox_sprite_height, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);

}
//Back of the textbox
draw_sprite_ext(textbox_sprite[page], textbox_image, _txtb_x, textbox_y, textbox_width/textbox_sprite_width, textbox_height/textbox_sprite_height, 0, c_white, 1);

//Options
if draw_char == text_length[page] && page == page_number - 1
	{
		//Option selection
		option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		option_pos = clamp(option_pos, 0, option_number - 1);
		if option_pos > (option_number - 1) { option_pos = 0; }
		if option_pos < 0 { option_pos = option_number - 1; }
		
		
		//Draw the options
		var _op_space = 20;
		var _op_bord = 4;
		for (var op = 0; op < option_number; op++)
		{
			//Option box
			var _o_width = string_width(option[op]) + _op_bord*2;
			draw_sprite_ext(textbox_sprite[page], textbox_image, _txtb_x+16, _txtb_y - _op_space*option_number + _op_space*op, _o_width/textbox_sprite_width, (_op_space-3)/textbox_sprite_height, 0, c_white, 1);
			
			//Draw the arrow next to the selected option
			if option_pos == op
			{
				draw_sprite(spr_textbox_arrow, 0, _txtb_x,  _txtb_y - _op_space*option_number + _op_space*op);
			}
			
			//Draw the option text
			draw_text(_txtb_x + 16 + _op_bord,  _txtb_y - _op_space*option_number + _op_space*op + 2, option[op]);
		}
		
	}

//Draw the text now
for(var c = 0; c < draw_char; c++)
	{
		
		//Special effects
		//Wavy or floating text
		var _float_y = 0;
		if float_text[c, page] == true
			{
				float_dir[c, page] += -6;
				_float_y = dsin(float_dir[c, page])*1;
			}
		//Shake text
		var _shake_x = 0;
		var _shake_y = 0;
		if shake_text[c, page] == true
			{
				shake_timer[c, page]--;
				if shake_timer[c, page] <= 0 {
						shake_timer[c, page] = irandom_range(4, 8);
						shake_dir[c, page] = irandom(360);
					}
				if shake_timer[c, page] <= 2 {
					_shake_x = lengthdir_x(1, shake_dir[c, page]);
					_shake_y = lengthdir_y(1, shake_dir[c, page]);
					}	
			}
		
		//The text
		draw_text_color(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], color_1[c, page], color_2[c, page], color_3[c, page], color_4[c, page], 1);

	}
