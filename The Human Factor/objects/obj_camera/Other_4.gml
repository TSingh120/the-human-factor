//only work if the player instance exists
if !instance_exists(obj_player) exit;

//get camera size
var _camwidth = camera_get_view_width(view_camera[0]);
var _camheight = camera_get_view_height(view_camera[0]);

//Set camera coordinates at start of room
finalcam_x = obj_player.x - _camwidth/2;
finalcam_y = obj_player.y - _camheight/2;

