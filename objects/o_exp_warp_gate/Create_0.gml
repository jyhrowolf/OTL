/// @description WARP PORTAL
event_inherited();

exploration_reward = function(_civilization)
{
	var gc = instance_find(o_game_controller,0);
	
	var hex = gc.selected_hex;
	if(gc.combat_hex != noone && array_length(gc.combat_initiative) > 0)
		hex = gc.combat_hex;
	var _x = hex.x;
	var _y = hex.y;
	hex.warp_gate = true;
	hex.victory_points += 2;
	
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
	update_planets(hex);
}