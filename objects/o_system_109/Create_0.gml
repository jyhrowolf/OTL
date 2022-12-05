/// @description settup planets and home system
// 2 planet, 2 pirate

var ship = instance_create_layer(x+10,y,"Player",o_pirate);
ships[0] = ship;
ship.update_color();
ship = instance_create_layer(x-10,y,"Player",o_pirate);
ships[1] = ship;
ship.update_color();

var placements = ds_map_create();
for(var i = 0; i < 2; i++)
{
	var index = irandom_range(0,5);
	while(ds_map_exists(placements,index))
		index = irandom_range(0,5);
	
	var planet = instance_create_layer(x+global.hex_size*.6*cos(pi/3*index),y+global.hex_size*.6*sin(pi/3*index),"Planets",o_planet);
	array_push(planets,planet);
	placements[? index] = 0;
}
ds_map_destroy(placements);

planets[0].slots = [0];
planets[0].resource = 0;
planets[0].image_index = 0;

planets[1].slots = [0];
planets[1].resource = 2;
planets[1].image_index = 2;

var controller = instance_find(o_game_controller,0);
var token = array_pop(controller.exploration_tokens);
exploration_token = instance_create_layer(x,y,"Controllers",asset_get_index(token));