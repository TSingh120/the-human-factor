depth = -9999;
global.font_main = font_add_sprite(spr_mainfont, 32, true, 1);

//Textbox parameters
textbox_width = 480;
textbox_height = 128;
border = 8;
line_sep = 12;
line_width = textbox_width - border*2;
textbox_sprite[0] = spr_textbox;
textbox_image = 0;
textbox_image_speed = 0/60;	//Animation speed of the textbox sprite divided by the speed of the game

//Text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_speed = 1;

//Options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

//Sound
snd_delay = 4;
snd_count = snd_delay;

//Effects
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;
