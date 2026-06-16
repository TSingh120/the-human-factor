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

//Voice
current_voice = noone;

pause = true; 
pause_surf = -1;
pause_surfbuffer = -1;

res_w = 1366;
res_h = 768;

// Deactivate specific game objects
instance_deactivate_object(obj_entity);
instance_deactivate_object(obj_camera);
instance_deactivate_object(obj_spawnpoint);
instance_deactivate_object(obj_healthbar);
instance_deactivate_object(obj_healthbarplayer);
instance_deactivate_object(obj_guiscaler);



// Capture this game moment
pause_surf = surface_create(res_w, res_h);
surface_set_target(pause_surf);
    draw_surface(application_surface, 0, 0);
surface_reset_target();

// Back up this surface buffer
if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
pause_surfbuffer = buffer_create(res_w * res_h * 4, buffer_fixed, 1);
buffer_get_surface(pause_surfbuffer, pause_surf, 0);
