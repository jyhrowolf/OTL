/// @description settup planets and home system
// 2 planet, no token
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

planets[0].slots = [1];
planets[0].resource = 2;
planets[0].image_index = 2;

planets[1].slots = [0];
planets[1].resource = 3;
planets[1].image_index = 3;