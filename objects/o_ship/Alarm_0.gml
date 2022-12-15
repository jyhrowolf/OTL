/// @description Distance self from ships
var close = false;
for(var i = 0; i < instance_number(object_index); i++)
{
	var o = instance_find(object_index,i);
	if(o.id != id)
	{
		if(distance_to_point(o.x,o.y) < (1+class)*2)
		{
			path_speed += orbit_speed/10;
			alarm[0] = class+1;
			close = true;
			break;
		}
	}
}
if(!close)
	path_speed = orbit_speed + blueprint.ship_display[1]/4;