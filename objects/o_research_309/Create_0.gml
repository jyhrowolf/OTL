/// @description Warp Portal
//class = 0, 1, 2, 3 - Millitary, Grid, Nano, Rare
//type = 0, 1, 2, 3, - Ship Part, Build, Instant, Permanent
// Inherit the parent event
event_inherited();
//hulls			- 0
//drives		- 1
//sources		- 2
//computers		- 3
//weapons		- 4
//missiles		- 5
//shields		- 6
research_trial = function(_civilization)
{
	//create a Warp Portal
	var pc = instance_find(o_player_controller,0);
	
	var hex = pc.players[pc.active_player].last_selected_hex;
	var _x = hex.x;
	var _y = hex.y;
	hex.warp_gate = true;
	
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
	
	p.slots = [];
	p.resource = 5;
	p.image_index = 5;
	
	array_push(hex.planets,p);
}