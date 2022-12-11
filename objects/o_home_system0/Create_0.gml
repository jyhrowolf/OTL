/// @description settup planets and home system
//default terran
var pc = instance_find(o_player_controller,0);
player = pc.active_player;
var ship = instance_create_layer(x,y,"Player",o_ship_10);
ship.player = pc.active_player;
ship.update_color();

ships[0] = ship;
array_push(pc.players[player].civilization.ships[0],ship);
pc.players[player].civilization.systems[0] = self;
pc.players[player].last_selected_hex = self;

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

planets[0].slots = [0,1];
planets[0].resources = 1;
planets[0].resource = 1;
planets[0].image_index = 1;
pc.players[player].civilization.resources_built[planets[0].resource] += 1;

planets[1].slots = [0,1];
planets[1].resources = 1;
planets[1].resource = 0;
planets[1].image_index = 0;
pc.players[player].civilization.resources_built[planets[1].resource] += 1;

pc.players[player].civilization.influence--;
pc.players[player].civilization.influence--;
pc.players[player].civilization.influence--;

pc.players[player].calculate_influence_upkeep(0);
pc.players[player].calculate_resource_income([0,0,0]);

update_planets(self);