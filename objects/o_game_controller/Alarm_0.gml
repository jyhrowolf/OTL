/// @description Create Map
if(ds_map_exists(map,map_hash([0,0])))
	return;
global.mouse_state = 0;
global.hex_size = 50;
global.hex_x = [];
global.hex_y = [];
for(var i = 0; i < 2*pi; i += pi/3)
{
	global.hex_x[i] = global.hex_size*cos(i);
	global.hex_y[i] = global.hex_size*sin(i);
}
global.hex_x[6] = global.hex_x[0];
global.hex_y[6] = global.hex_y[0];

hex_width = global.hex_size*2;
hex_height = global.hex_size*sqrt(3);
width = 5;
height = 5;

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

// settup neutral blueprints
instance_create_layer(0,0,"Controllers",o_blueprint_00);
instance_create_layer(0,0,"Controllers",o_blueprint_01);
instance_create_layer(0,0,"Controllers",o_blueprint_02);

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
			[1,1,1,1,1,1]];
var _layout = maps[attributes[0] - 2];

var guardian_list = ds_list_create();
for(var i = 0; i < 4; i++)
{
	ds_list_add(guardian_list,"o_guardian_system_" + string(i));
}
ds_list_shuffle(guardian_list);

for(var i = 0; i < 6; i++)
{
	if(_layout[i] == 0)
	{
		var ran = ds_list_find_value(guardian_list,0);
		ds_list_delete(guardian_list,0);
		_point = flat_hex_to_pixel(adv[i],global.hex_size);
		system = instance_create_layer(_point[0],_point[1],"Map",asset_get_index(ran));
		system.hex_coord = adv[i];
		system.tier = tier_calculate(adv[i]);
		system.depth = 3;
		rotate_layout(system,i+1);
		instance_destroy(map[? map_hash(adv[i])])
		map[? map_hash(adv[i])] = system;
	}
	else
	{
		player_controller.active_player += 1;
		player = instance_create_layer(system.x,system.y,"Player",o_player);
		player.rot = i;
		player.player = player_controller.active_player;
		array_push(player_controller.players, player);
		
		var spec = noone;
		if(attributes[player_controller.active_player+11] < 6)
			spec = asset_get_index("o_species" + string(attributes[player_controller.active_player+11]));
		else
			spec = o_species_terran;
		
		species = instance_create_layer(system.x,system.y,"Player",spec);
		if(species.faction_color == #000000)
			species.faction_color = global.player_color[player_controller.active_player];
		player.setup_species(species);
		
		_point = flat_hex_to_pixel(adv[i],global.hex_size);
		system = instance_create_layer(_point[0],_point[1],"Map",species.home_system);
		system.hex_coord = adv[i];
		system.tier = tier_calculate(adv[i]);
		system.depth = 3;
		rotate_layout(system,i+1);
		
		instance_destroy(map[? map_hash(adv[i])])
		map[? map_hash(adv[i])] = system;
	}
}
ds_list_destroy(guardian_list);

player_controller.active_player = 1; // set the first player to the active player.
var cur_player = player_controller.players[player_controller.active_player];
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