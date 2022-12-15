/// @description Move to target hex
if(target != noone)
{
	path_end();
	x = lerp(x,target.x,complete);
	y = lerp(y,target.y,complete);
	direction = point_direction(x,y,target.x,target.y);
	complete += orbit_speed/200;
	if((abs(x-target.x) < 2 && abs(y-target.y) < 2) && complete < 1)
	{
		complete = 1;
		target = noone;
		complete = 0;
		ship_path_start(orbit_speed + blueprint.ship_display[1]/4,false);
	}
}