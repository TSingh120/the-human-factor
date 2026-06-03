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

//Sprites
idle_sprite = spr_playeridle;
dash_sprite = spr_playerdash;
walk_sprite = spr_playerrun;
jump_sprite = spr_playerjump;
mask_sprite = spr_playeridle;
wall_sprite = spr_playerwallslide;
slide_sprite = spr_playerslide;
slidemask_sprite = spr_playerslide;
attack_sprite = spr_playerattack;
block_sprite = spr_playerblock;
stunned_sprite = spr_playerstunned;

//Moving
facing_dir = 1;
move_dir = 0; //direction of the player, negative is left
move_speed = 4; //speed at which the player'll move
x_speed = 0;	  //the players speed horizontally
y_speed = 0;	  //the players speed 

	//Dashing
	dash_speed = 12;
	dash_duration = 0;
	dash_cooldown = 0;
	
	//Sliding
	slide_speed = 8;
	slide_duration = 0;
	slide_cooldown = 0;

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
coyote_jumpframes = 8;
coyote_jumptimer = 0;

//Wall sliding and jumping physics
wall_slide_speed = 2;        //Max speed sliding down a wall
wall_jump_hsp = 5;           //Horizontal push off the wall
wall_jump_vsp = -10;          //Vertical push off the wall (matches first jump speed)
wall_jump_timer = 0;         //Tracks how long controls are locked
wall_jump_control_loss = 5; //Frames before player regains steering

//Combat stuff
state = "idle";
action_timer = 0; //tracking how long a dude is stuck in a state
hp = 100;
iframes = 0;
faction = "player";
damage = 20;
stunned_timer = 90;
countered_timer = 60;
