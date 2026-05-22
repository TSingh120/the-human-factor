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

//Set cam coordinate variables
finalcam_x += (_cam_x - finalcam_x) * cam_trailspeed;
finalcam_y += (_cam_y - finalcam_y) * cam_trailspeed;

//Set camera coords
camera_set_view_pos(view_camera[0], _cam_x, _cam_y);