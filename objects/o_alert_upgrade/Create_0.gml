/// @description Settup upgrade alert

// Inherit the parent event
event_inherited();
screen_darken = instance_create_layer(0,0,"GUI",o_alert_screen_darken);
screen_darken.depth = -11;

player_controller = instance_find(o_player_controller,0);
current_civ = player_controller.players[player_controller.active_player].civilization;

available_upgrades = current_civ.upgrades;
available_blueprints = player_controller.players[player_controller.active_player].blueprints;

init_map = ds_map_create();
final_map = ds_map_create();

x = view_get_wport(0)/2;
y = view_get_hport(0)*2/5;
image_xscale = 3;
image_yscale = 3;
var bb;
var b_index = 0;
var _x = 0;
var _y = 0;
for(var i = 0; i < array_length(available_upgrades)-1; i++)
{
	_x = -241;
	if(i < 3)
	{
		_x = -_x;
		_y = 61 - i*23;
	}
	else
	{
		if(i == 4)
			_y = 61;
		else if(i == 5)
			_y = 61 - 23;
		else if(i == 3)
			_y = 61 - 23*2;
		else if(i == 6)
			_y = 61 - 23*3;
	}
	for(var j = 0; j < array_length(available_upgrades[i]); j++)
	{
		if(available_upgrades[i][j] == 1)
		{
			bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_upgrade_display);
			bb.image_xscale = 3;
			bb.image_yscale = 3;
			bb.generate_upgrade(string(i)+string(j));
			my_buttons[b_index++] = bb;
		}
	}
}
// rare upgrades
_x = 241;
_y = -13;

for(var j = 0; j < array_length(available_upgrades[i]); j++)
{
	bb = instance_create_layer(x+(_x-j*23)*3,y-(_y)*3,"GUI",o_alert_upgrade_display);
	bb.image_xscale = 3;
	bb.image_yscale = 3;
	bb.rare = j;
	bb.generate_rare_upgrade(available_upgrades[i][j]);
	my_buttons[b_index++] = bb;
}
// blueprint
_x = -164;
_y = 79;
for(var i = 0; i < array_length(available_blueprints); i++)
{
	bb = instance_create_layer(x+(_x + (165)*(i >= 2))*3,y-(_y - (79)*(i == 1 || i == 2))*3,"GUI",o_alert_upgrade_blueprint_display);
	bb.image_xscale = 3;
	bb.image_yscale = 3;
	bb.settup_blueprint(available_blueprints[i]);
	if(i == 3)
		bb.starbase = true;
	if(current_civ.buildable[i] != 1)
		bb.image_alpha = 0.6;
	my_buttons[b_index++] = bb;
	
	var keys = [];
	ds_map_keys_to_array(bb.init_map,keys);
	for(var k = 0; k < array_length(keys); k++)
	{
		var val = bb.init_map[? keys[k]]
		if(ds_map_exists(init_map, keys[k]))
			init_map[? keys[k]] += val;
		else
			init_map[? keys[k]] = val;
	}
}

ds_map_copy(final_map,init_map);

_x = -50;
_y = -103;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_yes);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[b_index++] = bb;

_x = 262;
_y = 106;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_x);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[b_index] = bb;

do_function = function(variable)
{
	if(variable == "rare")
	{
		state = global.mouse_state;
	}
}