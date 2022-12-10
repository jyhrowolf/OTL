/// @description Combat
var gc = instance_find(o_game_controller, 0);

if(action == 0)
{
	action = 8;
	if(gc.combat_hex != noone) // center camera on combat_hex
	{
		var hex = gc.combat_hex;
		var c_width = camera_get_view_width(view_camera[0]); 
		var c_height = camera_get_view_height(view_camera[0]);
		camera_set_view_pos(view_camera[0],hex.x-c_width/2,hex.y-c_height/2);
	}
}
else if(action == 8)
{
	busy = 1;
	gc.alarm[8] = 1;
	if(gc.combat_hex != noone) // center camera on combat_hex
	{
		var hex = gc.combat_hex;
		var c_width = camera_get_view_width(view_camera[0]); 
		var c_height = camera_get_view_height(view_camera[0]);
		camera_set_view_pos(view_camera[0],hex.x-c_width/2,hex.y-c_height/2);
	}
}