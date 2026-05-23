//custom functions for player
function setonground(_val = true)
{
	if _val == true
	{
		on_ground = true;
		coyote_hangtimer = coyote_hangframes;
	} else {
		on_ground = false;
		coyote_hangtimer = 0;
	}
}

//Control setup
controlsetup();

//Moving

move_dir = 0; //direction of the player, negative is left
move_speed = 4; //speed at which the player'll move
x_speed = 0;	  //the players speed horizontally
y_speed = 0;	  //the players speed vertically

//Jumping and falling

gravity_speed = 0.65; //force of the gravity pulling the player down (ts works 0.5 pixels per frame)
term_vel = 15; //terminal velocity, max player falling speed. i dont even need to write this, why am i typing this out. is it for someone whos gonna see the code? i guess so. but is anyone gonna see my code anyways though?
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
on_ground = true;

//jumping successions
jump_hold_frames[0] = 15;
jump_speed[0] = -6;
jump_hold_frames[1] = 8;
jump_speed[1] = -6;

//Coyote time
//Hang time
coyote_hangframes = 2;
coyote_hangtimer = 0;

//Jump buffer timer
coyote_jumpframes = 5;
coyote_jumptimer = 0;