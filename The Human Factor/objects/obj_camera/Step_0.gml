//only work if the player instance exists
if !instance_exists(obj_player) exit;

//get camera size
var _camwidth = camera_get_view_width(view_camera[0]);
var _camheight = camera_get_view_height(view_camera[0]);

//Get camera target coordinates
var _cam_x = obj_player.x - _camwidth/2;
var _cam_y = obj_player.y - _camheight/2;

//Restrict the camera to the room borders
_cam_x = clamp(_cam_x, 0, room_width - _camwidth);
_cam_y = clamp(_cam_y, 0, room_height - _camheight);

//Set cam coordinate variables (Smooth trailing)
finalcam_x += (_cam_x - finalcam_x) * cam_trailspeed;
finalcam_y += (_cam_y - finalcam_y) * cam_trailspeed;

//Set camera coords using the SMOOTHED variables
camera_set_view_pos(view_camera[0], finalcam_x, finalcam_y);

if (layer_exists("Backgrounds_2"))
{
	layer_x("Backgrounds_2",obj_player.x/4);
}
if (layer_exists("Backgrounds_3"))
{
	layer_x("Backgrounds_3",obj_player.x/7);
}
if (layer_exists("Backgrounds_4"))
{
	layer_x("Backgrounds_4",obj_player.x/10);
}
if (layer_exists("Backgrounds_5"))
{
	layer_x("Backgrounds_5",obj_player.x/20);
}
