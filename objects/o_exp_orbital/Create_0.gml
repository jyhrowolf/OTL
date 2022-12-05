/// @description Make an orbital

// Inherit the parent event
event_inherited();

exploration_reward = function(_civilization)
{
	_civilization.calculate_resource(2,2);
	var gc = instance_find(o_game_controller,0);
	
	var hex = gc.selected_hex;
	var _x = hex.x;
	var _y = hex.y;
	
	var placements = ds_map_create();
	for(var i = 0; i < 6; i++)
	{
		if(instance_position(_x+global.hex_size*.45*cos(pi/3*i),_y+global.hex_size*.45*sin(pi/3*i),o_planet))
			placements[? i] = 1;
	}
	
	var index = irandom_range(0,5);
	while(ds_map_exists(placements,index))
		index = irandom_range(0,5);
	ds_map_destroy(placements);
	
	var p = instance_create_layer(_x+global.hex_size*.6*cos(pi/3*index),_y+global.hex_size*.6*sin(pi/3*index),"Planets",o_planet);
	
	p.slots = [0];
	p.resource = 4;
	p.image_index = 4;
	
	array_push(hex.planets,p);
}