/// @description Draw Planet
if(global.map_toggle)
{
	draw_self();
	for(var i = 0; i < array_length(slots); i++)
	{
		draw_sprite(s_resource_slot,slots[i], x - 5*(array_length(slots)-1) + 10*i, y + 10);
		if(i < resources)
		{
			draw_sprite_ext(s_resource,slots[i], x - 5*(array_length(slots)-1) + 10*i, y + 10,1,1,0,my_color,1);
		}
	}
}