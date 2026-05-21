//Get inputs
rightkey = keyboard_check(vk_right);
leftkey = keyboard_check(vk_left);

//X movement
//Direction

move_dir = rightkey - leftkey;

//Get xspeed

x_speed = move_dir * move_speed;

//x collisions

var _subpixel = 0.5;
if place_meeting(x+ x_speed, y, obj_wall)








































