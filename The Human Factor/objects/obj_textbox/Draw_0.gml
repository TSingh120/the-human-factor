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
			//If there are no characters, center the textbox
			text_x_offset[p] = 128;
		
	}
	
}



//Typing the text
if draw_char < text_length[page] 
{
		draw_char += text_speed;
		draw_char = clamp(draw_char, 0, text_length[page]);
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
			}
			//Destroying/Exiting the textbox once out of pages
			else { instance_destroy(); }
		}
		else 
			{
		draw_char = text_length[page];	
			}
	
}

//Draw the textbox itself
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
textbox_image += textbox_image_speed;
textbox_sprite_width = sprite_get_width(textbox_sprite);
textbox_sprite_height = sprite_get_height(textbox_sprite);
//Back of the textbox
draw_sprite_ext(textbox_sprite, textbox_image, _txtb_x, textbox_y, textbox_width/textbox_sprite_width, textbox_height/textbox_sprite_height, 0, c_white, 1);

//Options
if draw_char == text_length[page] && page == page_number - 1
	{
		
		//Draw the options
		var _op_space = 20;
		var _op_bord = 8;
		for (var op = 0; op < option_number; op++)
		{
			//Option box
			var _o_width = string_width(option[op]) + _op_bord*2;
			draw_sprite_ext(textbox_sprite, textbox_image, _txtb_x+32, _txtb_y - _op_space*option_number + _op_space*op, _o_width/textbox_sprite_width, (_op_space-3)/textbox_sprite_height, 0, c_white, 1);
			
			//Draw the option text
			draw_text(_txtb_x + 16 + _op_bord,  _txtb_y - _op_space*option_number + _op_space*op + 2, option[op]);
		}
		
	}

//Draw the text now
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(_txtb_x+border, _txtb_y+border, _drawtext, line_sep, line_width);

























	
	
	
	