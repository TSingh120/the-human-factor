var _sprt = spr_bosshealthbar;
var _sprt_width = sprite_get_width(_sprt);
var _sprt_height = sprite_get_height(_sprt);
var _viewport = view_camera[0];

var x_position = (camera_get_view_width(_viewport)/2);
var y_position = (camera_get_view_height(_viewport)/10);

var x_offset = (x_position - round(_sprt_width/2) - 154);
var y_offset = (y_position - round(_sprt_height/2) - 24);

draw_sprite_ext(_sprt, 0, x_offset, y_offset, 4, 1.5, 0, c_white, 1);
draw_sprite_ext(_sprt, 1, x_offset, y_offset, (health_points_prev/health_points_max)*4, 1.5, 0, c_white, 1);
draw_sprite_ext(_sprt, 2, x_offset, y_offset, (health_points/health_points_max)*4, 1.5, 0, c_white, 1);
draw_sprite_ext(_sprt, 3, x_offset, y_offset, 4, 1.5, 0, c_white, 1);

var _x_length = 120;
var _marker_value = 250;
var _marker_count = (health_points_max/_marker_value);

var _marker_offset = (_x_length/_marker_count)*4;

for (var h = 1; h < _marker_count; h++)
	{
			draw_sprite_ext(spr_bosshealthmarker, 0, x_offset + (_marker_offset*h) - 1, y_offset, 1, 1, 0, c_white, 1);
	}
