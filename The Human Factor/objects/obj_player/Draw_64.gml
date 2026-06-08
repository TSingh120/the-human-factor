/// @DnDAction : YoYo Games.Drawing.Draw_Healthbar
/// @DnDVersion : 1
/// @DnDHash : 0131DD80
/// @DnDArgument : "x1" "20"
/// @DnDArgument : "y1" "30"
/// @DnDArgument : "x2" "340"
/// @DnDArgument : "y2" "60"
/// @DnDArgument : "value" "obj_player.hp"
/// @DnDArgument : "backcol" "$5A000000"
/// @DnDArgument : "mincol" "$FF0000FF"
/// @DnDArgument : "maxcol" "$FF00FF00"
draw_healthbar(20, 30, 340, 60, obj_player.hp, $5A000000 & $FFFFFF, $FF0000FF & $FFFFFF, $FF00FF00 & $FFFFFF, 0, (($5A000000>>24) != 0), (($FFFFFFFF>>24) != 0));