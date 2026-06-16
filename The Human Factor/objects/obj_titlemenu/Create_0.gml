width = 250;
height = 75;

op_border = 8;
op_space = 16;

pos = 0;

//Starting menu
option[0, 0] = "Play";
option[0, 1] = "Setting(s) (They don't do anything.)";
option[0, 2] = "Credits";
option[0, 3] = "Quit Game";

//settings
option[1, 0] = "Music Volume";
option[1, 1] = "Sound effects volume";
option[1, 2] = "Toggle Shaders";
option[1, 3] = "< Back";

//Credits
option[2, 0] = "Player voiced by Sukhman";
option[2, 1] = "Kian voiced by Kian";
option[2, 2] = "Leonard voiced by Ishmeet";
option[2, 3] = "Edmund voiced by someone (I dunno yet).";
option[2, 4] = "< Back";

op_length = array_length(option);
menu_level = 0;
