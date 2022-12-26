/// @description Create Map
if(ds_map_exists(map,map_hash([0,0])))
	return;
global.mouse_state = 0;
global.hex_size = 50;
global.hex_x = [];
global.hex_y = [];
global.hex_gate_x = [];
global.hex_gate_y = [];
for(var i = 0; i < 2*pi; i += pi/3)
{
	global.hex_x[i] = global.hex_size*cos(i);
	global.hex_y[i] = global.hex_size*sin(i);
}
global.hex_x[6] = global.hex_x[0];
global.hex_y[6] = global.hex_y[0];

var i = 0;
var t = 0.507;
var d = 1.019;
global.hex_gate_x[i] = lerp(global.hex_x[i]*d,global.hex_x[i+1]*d,t);
global.hex_gate_y[i] = lerp(global.hex_y[i]*d,global.hex_y[i+1]*d,t);
i++;
t = 0.48;
d = 1.011;
global.hex_gate_x[i] = lerp(global.hex_x[i]*d,global.hex_x[i+1]*d,t);
global.hex_gate_y[i] = lerp(global.hex_y[i]*d,global.hex_y[i+1]*d,t);
i++;
t = 0.472;
d = 0.981;
global.hex_gate_x[i] = lerp(global.hex_x[i]*d,global.hex_x[i+1]*d,t);
global.hex_gate_y[i] = lerp(global.hex_y[i]*d,global.hex_y[i+1]*d,t);
i++;
t = 0.492;
d = 0.959;
global.hex_gate_x[i] = lerp(global.hex_x[i]*d,global.hex_x[i+1]*d,t);
global.hex_gate_y[i] = lerp(global.hex_y[i]*d,global.hex_y[i+1]*d,t);
i++;
t = 0.52;
d = 0.967;
global.hex_gate_x[i] = lerp(global.hex_x[i]*d,global.hex_x[i+1]*d,t);
global.hex_gate_y[i] = lerp(global.hex_y[i]*d,global.hex_y[i+1]*d,t);
i++;
t = 0.527;
d = 0.997;
global.hex_gate_x[i] = lerp(global.hex_x[i]*d,global.hex_x[i+1]*d,t);
global.hex_gate_y[i] = lerp(global.hex_y[i]*d,global.hex_y[i+1]*d,t);
global.hex_gate_x[6] = global.hex_gate_x[0];
global.hex_gate_y[6] = global.hex_gate_y[0];
var temp_gate_x = [];
var temp_gate_y = [];
for(var i = 0; i < 6; i ++)
{
	temp_gate_x[i] = global.hex_gate_x[6-i];
	temp_gate_y[i] = global.hex_gate_y[6-i];
}
for(var i = 0; i < 6; i ++)
{
	global.hex_gate_x[i] = temp_gate_x[i];
	global.hex_gate_y[i] = temp_gate_y[i];
}

hex_width = global.hex_size*2;
hex_height = global.hex_size*sqrt(3);
width = 6;
height = 6;

for (var q = -width+1; q < width; q++)
	for(var r = -height+1; r < height; r++)
	{
		if(-q-r < (height+width) div 2 && q+r < (width + height) div 2)
		{
			var sys = instance_create_layer(q*hex_width*3/4, (r+q/2)*hex_height,"Map",o_system);
			sys.hex_coord = [q,r];
			sys.tier = tier_calculate([q,r]);
			sys.depth = sys.tier + 2;
			map[? map_hash([q,r])] = sys;
		}
	}

// setup center
q = 0; 
r = 0;
var _point = flat_hex_to_pixel([q,r],global.hex_size);
var player = instance_create_layer(_point[0],_point[1],"Player",o_player);
array_push(player_controller.players, player);
var species = instance_create_layer(0,0,"Player",o_species_neutrals);
player.setup_species(species);

var system = instance_create_layer(_point[0],_point[1],"Map",o_center_system);
system.depth = 2;
instance_destroy(map[? map_hash([q,r])])
map[? map_hash([q,r])] = system;

var adv = [
    [2,0], [2,-2], [0,-2], 
    [-2,0], [-2,2], [0,2] 
];

var maps = [[0,0,1,0,0,1],
			[1,0,1,0,1,0],
			[1,0,1,1,0,1],
			[1,1,1,1,1,0],
			[1,1,1,1,1,1],
			[0,1,1,1,0,1,1,1,1],
			[0,1,1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1,1,1],
			];
var _layout = maps[attributes[0] - 2];

var guardian_list = ds_list_create();
for(var i = 0; i < 4; i++)
{
	ds_list_add(guardian_list,"o_guardian_system_" + string(i));
}
ds_list_shuffle(guardian_list);

if(array_length(_layout) > 6)
	adv = [
		[3,-1], [3,-3], [1,-3], [-1,-2],
		[-3,0], [-3,2], [-2,3], [0,3], [2,1]
	];
var rot = 0;
for(var i = 0; i < array_length(_layout); i++)
{
	if(array_length(_layout) > 6)
		if(i%3 == 2)
			rot--;
	if(_layout[i] == 0)
	{
		var ran = ds_list_find_value(guardian_list,0);
		ds_list_delete(guardian_list,0);
		_point = flat_hex_to_pixel(adv[i],global.hex_size);
		system = instance_create_layer(_point[0],_point[1],"Map",asset_get_index(ran));
		system.hex_coord = adv[i];
		system.tier = tier_calculate(adv[i]);
		system.depth = 3;
		rotate_layout(system,rot+1);
		instance_destroy(map[? map_hash(adv[i])])
		map[? map_hash(adv[i])] = system;
	}
	else
	{
		player_controller.active_player += 1;
		player = instance_create_layer(system.x,system.y,"Player",o_player);
		player.rot = rot;
		player.player = player_controller.active_player;
		array_push(player_controller.players, player);

		var spec = asset_get_index("o_species" + string(attributes[player_controller.active_player+11]));
		
		species = instance_create_layer(system.x,system.y,"Player",spec);
		if(species.faction_color == #000000)
		{
			species.faction_color = global.player_color[player_controller.active_player];
		}
		else
		{
			global.player_color[player_controller.active_player] = species.faction_color;
		}
		player.setup_species(species);
		
		_point = flat_hex_to_pixel(adv[i],global.hex_size);
		system = instance_create_layer(_point[0],_point[1],"Map",species.home_system);
		system.hex_coord = adv[i];
		system.tier = tier_calculate(adv[i]);
		system.depth = 3;
		rotate_layout(system,rot+1);
		
		instance_destroy(map[? map_hash(adv[i])])
		map[? map_hash(adv[i])] = system;
	}
	rot++;
}
ds_list_destroy(guardian_list);

player_controller.active_player = 1; // set the first player to the active player.
var cur_player = player_controller.players[player_controller.active_player];
cursor.update_cursor(cur_player);
cur_player.civilization.calculate_colony(cur_player.civilization.colony);
cur_player.calculate_resource_income([0,0,0]);
cur_player.civilization.calculate_resources([0,0,0]);
cur_player.calculate_influence_upkeep(0);

system = player_controller.players[player_controller.active_player].last_selected_hex;
selected_hex = system;
bottom_bar.my_buttons[6].image_index = 2;

rotate_camera(player_controller,0,selected_hex);

show_debug_message("ROUND: 0");

instance_create_layer(0,0,"GUI",o_alert_controller);
alarm[1] = 1;