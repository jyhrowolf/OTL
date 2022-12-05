/// @description Mouse Hovering Hex
if(global.mouse_state < 1)
{
	var point = [mouse_x,mouse_y];
	var hex = pixel_to_flat_hex(point,global.hex_size);
	if(ds_map_exists(map, map_hash(hex)))
	{
		if(hovered_hex != noone)
		{
			hovered_hex.hovered = false;
			hovered_hex.depth = hovered_hex.tier;
			if(hovered_hex.explored)
				hovered_hex.depth = 3;
			if(hovered_hex.highlighted)
				hovered_hex.depth = 2;
		}
		hovered_hex = map[? map_hash(hex)];
		hovered_hex.hovered = true;
		if(!hovered_hex.explored && !hovered_hex.highlighted)
			hovered_hex.depth = 4;
		else
			hovered_hex.depth = 2;
	}
}
else
{
	if(hovered_hex != noone)
	{
		hovered_hex.hovered = false;
		hovered_hex.depth = hovered_hex.tier;
		if(hovered_hex.explored)
			hovered_hex.depth = 3;
		if(hovered_hex.highlighted)
			hovered_hex.depth = 2;
	}
}