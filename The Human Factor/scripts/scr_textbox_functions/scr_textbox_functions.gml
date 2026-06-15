function scr_set_defaults_for_text() 
{
	line_break_pos[0, page_number] = 9999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//Variables for every letter/character
	for (var c = 0; c < 500; c++)
		{
		
			color_1[c, page_number] = c_white;
			color_2[c, page_number] = c_white;
			color_3[c, page_number] = c_white;
			color_4[c, page_number] = c_white;
			
			float_text[c, page_number] = 0;
			float_dir[c, page_number] = c*20;
			
			shake_text[c, page_number] = 0;
			shake_dir[c, page_number] = irandom(360);
			shake_timer[c, page_number] = irandom(4);
		
		}
		
	textbox_sprite[page_number] = spr_textbox;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_midtext;
	voice_line[page_number] = noone;
}

//Text vfx
/// @param first_char
/// @param last_char
/// @param color_1
/// @param color_2
/// @param color_3
/// @param color_4
function scr_text_color(_start, _end, _color1, _color2, _color3, _color4){
	
		for (var c = _start; c <= _end; c++)
			{
				color_1[c, page_number-1] = _color1;
				color_2[c, page_number-1] = _color2;
				color_3[c, page_number-1] = _color3;
				color_4[c, page_number-1] = _color4;
			}

	}
	
/// @param first_char
/// @param last_char
function scr_text_float(_start, _end){
	
	for (var c = _start; c <= _end; c++)
			{
				float_text[c, page_number-1] = true;
			}
	
}

/// @param first_char
/// @param last_char
function scr_text_shake(_start, _end){
	
	for (var c = _start; c <= _end; c++)
			{
				shake_text[c, page_number-1] = true;
			}
	
}
	

/// @param text
/// @param [character]
/// @param [side]
/// @param [voice_line]
function scr_text(_text){
	
	scr_set_defaults_for_text();
	
	text[page_number] = _text;
	
	//Get character info/data
	if argument_count > 1 {
		switch(argument[1])
		{
			
			case "Leon":
				speaker_sprite[page_number] = spr_leonprofile;
				textbox_sprite[page_number] = spr_textbox;
				snd[page_number] = snd_midtext;
				break;
				
			case "Leon surprised":
				speaker_sprite[page_number] = spr_leonsurprise;
				textbox_sprite[page_number] = spr_textbox;
				snd[page_number] = snd_hightext;
				break;
				
			case "Wesker":
				speaker_sprite[page_number] = spr_weskerprofile;
				textbox_sprite[page_number] = spr_textboxred;
				snd[page_number] = snd_lowtext;
				break;
				
			case "Wesker smirk":
				speaker_sprite[page_number] = spr_weskersmirk;
				textbox_sprite[page_number] = spr_textboxred;
				snd[page_number] = snd_hightext;
				break;
				
			case "Chris":
				speaker_sprite[page_number] = spr_chrisprofile;
				textbox_sprite[page_number] = spr_textbox;
				snd[page_number] = snd_lowtext;
				break;				
					
			case "Chris look":
				speaker_sprite[page_number] = spr_chrisprofile2;
				textbox_sprite[page_number] = spr_textbox;
				snd[page_number] = snd_lowtext;
				break;
				
		}
		
		// Voice line audio file
		if argument_count > 3 
		{
			voice_line[page_number] = argument[3];	
		}
	}
	
	//Side the character is on
	if argument_count > 2 {
		speaker_side[page_number] = argument[2];	
	}
	
	page_number++;
	
}

/// @param option
/// @param link_id
function scr_option(_option, _link_id){
	
		option[option_number] = _option;
		option_link_id[option_number] = _link_id;
		
		option_number++;
	
}

/// @param text_id
function create_textbox(_text_id) 
{
	
	with (instance_create_depth(0, 0, -9999, obj_textbox))
	{
		scr_gametext(_text_id);
	}

}

