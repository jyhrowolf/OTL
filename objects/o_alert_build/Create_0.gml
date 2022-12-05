/// @description Settup build alert

// Inherit the parent event
event_inherited();
screen_darken = instance_create_layer(0,0,"GUI",o_alert_screen_darken);
screen_darken.depth = -11;

player_controller = instance_find(o_player_controller,0);
current_civ = player_controller.players[player_controller.active_player].civilization;

var available_blueprints = player_controller.players[player_controller.active_player].blueprints;

x = view_get_wport(0)/2;
y = view_get_hport(0)*2/5;
image_xscale = 2;
image_yscale = 2;
var bb;
var b_index = 0;
var _x = 0;
var _y = 0;

_x = -164;
_y = 79;
for(var i = 0; i < array_length(available_blueprints); i++)
{
	bb = instance_create_layer(x+(_x + (165)*(i >= 2))*2,y-(_y - (79)*(i == 1 || i == 2))*2,"GUI",o_alert_build_blueprint_display);
	bb.image_xscale = 2;
	bb.image_yscale = 2;
	bb.settup_blueprint(available_blueprints[i]);
	bb.buildable = i;
	bb.cost = current_civ.buildable_cost[i];
	bb.ships = current_civ.max_ships[i] - array_length(current_civ.ships[i]);
	if(current_civ.buildable[i] != 1)
		bb.image_alpha = 0.6;
	my_buttons[b_index++] = bb;
}
//orbital
_x = -274;
_y = 79;
bb = instance_create_layer(x+(_x)*2,y-(_y)*2,"GUI",o_alert_build_blueprint_display);
bb.image_xscale = 2;
bb.image_yscale = 2;
bb.sprite_index = s_blueprint_clean_orbital;
bb.buildable = i;
bb.cost = current_civ.buildable_cost[i];
bb.blueprint_name = "Orbital";
bb.ships = -1;
if(current_civ.buildable[i] != 1)
	bb.image_alpha = 0.6;
my_buttons[b_index++] = bb;
i++;

//monolith
_x = 167;
_y = 79;
bb = instance_create_layer(x+(_x)*2,y-(_y)*2,"GUI",o_alert_build_blueprint_display);
bb.image_xscale = 2;
bb.image_yscale = 2;
bb.sprite_index = s_blueprint_clean_monolith;
bb.buildable = i;
bb.cost = current_civ.buildable_cost[i];
bb.blueprint_name = "Monolith";
bb.ships = -1;
if(current_civ.buildable[i] != 1)
	bb.image_alpha = 0.6;
my_buttons[b_index++] = bb;

_x = -50;
_y = -103;

bb = instance_create_layer(x+(_x)*2,y-(_y)*2,"GUI",o_alert_yes);
bb.image_xscale = 2;
bb.image_yscale = 2;
bb.image_index = 0;
my_buttons[b_index++] = bb;

_x = 262;
_y = 106;

bb = instance_create_layer(x+(_x)*2,y-(_y)*2,"GUI",o_alert_x);
bb.image_xscale = 2;
bb.image_yscale = 2;
bb.image_index = 0;
my_buttons[b_index] = bb;

//alarm[3] = 1;