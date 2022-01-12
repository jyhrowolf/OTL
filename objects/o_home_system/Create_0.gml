/// @description settup planets and home system
//default terran
var placements = ds_map_create();
for(var i = 0; i < 3; i++)
{
	var index = irandom_range(0,5);
	while(ds_map_exists(placements,index))
		index = irandom_range(0,5);
	
	var planet = instance_create_layer(x+52*.6*cos(pi/3*index),y+52*.6*sin(pi/3*index),"Planets",o_planet);
	array_push(planets,planet);
	placements[? index] = 0;
}
ds_map_destroy(placements);

planets[0].slots = [0,1];
planets[0].resource = 1;
planets[0].image_index = 1;

planets[1].slots = [0,1];
planets[1].resource = 2;
planets[1].image_index = 2;

planets[2].slots = [0];
planets[2].resource = 3;
planets[2].image_index = 3;