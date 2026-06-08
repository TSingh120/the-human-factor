depth = -9999;
global.font_main = font_add_sprite(spr_mainfont, 32, true, 1);

//Textbox parameters
textbox_width = 480;
textbox_height = 128;
border = 8;
line_sep = 12;
line_width = textbox_width - border*2;
textbox_sprite = spr_textbox;
textbox_image = 0;
textbox_image_speed = 0/60;	//Animation speed of the textbox sprite divided by the speed of the game

//Text
page = 0;
page_number = 0;
text[0] = "im gonna take my horse on the old town road im gonna ride till i cant no more";
text[1] = "im beginning to feel like a rap god rap god all my people from the front to the back nod back nod";
text[2] = "Optimus";
text[3] = "now who thinks their arms are long enough to slap box slap box they say i rap like a robot so call me rap bot but for me to rap like a computer it must be in my genes i got a laptop in back pocket my pen'll go off when i half cock it got a fat knot from that rap profit made a living and a killing off it ever since bill clinton was still in office with monica lewinsky feeling on his nutsack im an mc still as honest but as rude and as indecent as all hell syllables killaholic kill em all with this flippity dippity hippity hip hop you really dont wanna get into a pissing match with rappity brat packing a mac in the back of ac backpack rap crap yap yap yackety and at the exact same time im attempting these lyrical acrobat stunts while im practicing that ill still be able to break a mfing table on the back of a couple fgs and crack it in half only realized it was ironic i was signed to aftermath after the fact how could i not realize all i do is drop f bombs feel the wrath of my attack rappers are having a rough time period heres a maxipad its actually disatrously wack ";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_speed = 1;

setup = false;
