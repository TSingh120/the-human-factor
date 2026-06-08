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
	page_number = array_length(text);
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
textbox_image += textbox_image_speed;
textbox_sprite_width = sprite_get_width(textbox_sprite);
textbox_sprite_height = sprite_get_height(textbox_sprite);
//Back of the textbox
draw_sprite_ext(textbox_sprite, textbox_image, textbox_x + text_x_offset[page], textbox_y, textbox_width/textbox_sprite_width, textbox_height/textbox_sprite_height, 0, c_white, 1);

//Draw the text now
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page]+ border, textbox_y + border, _drawtext, line_sep, line_width);

























	
	
	
	