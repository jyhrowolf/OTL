/// @description Create Map
hex_width = sprite_get_width(s_system);
hex_height = sprite_get_height(s_system);
width = 5;
height = 5;

var adv = [
    [1,0], [1,-1], [0,-1], 
    [-1,0], [-1,1], [0,1] 
];

for (var q = -width+1; q < width; q++)
	for(var r = -height+1; r < height; r++)
	{
		if(-q-r < (height+width) div 2 && q+r < (width + height) div 2)
			map[? map_hash([q,r])] = instance_create_layer(q*hex_width*3/4, (r+q/2)*hex_height,"Map",o_system);
	}
	
if(attributes[0] == 2)
{
	q = 0; 
	r = 2;
	var system = instance_create_layer(q*hex_width*3/4, (r+q/2)*hex_height,"Map",o_home_system);
	system.explored = true;
	system.image_index = 2;
	system.ownership = 1;
	instance_destroy(map[? map_hash([q,r])])
	map[? map_hash([q,r])] = system;
	
	q = 0; 
	r = -2;
	system = instance_create_layer(q*hex_width*3/4, (r+q/2)*hex_height,"Map",o_home_system);
	system.explored = true;
	system.image_index = 2;
	system.ownership = 2;
	instance_destroy(map[? map_hash([q,r])])
	map[? map_hash([q,r])] = system;
}

var c_width = camera_get_view_width(view_camera[0]);
var c_height = camera_get_view_height(view_camera[0]);
camera_set_view_pos(view_camera[0],map[? map_hash([0,2])].x-c_width/2,map[? map_hash([0,2])].y-c_height/2);