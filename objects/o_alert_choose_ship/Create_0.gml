/// @description Settup choose ship alert

// Inherit the parent event
event_inherited();
depth = -18
screen_darken = instance_create_layer(0,0,"GUI",o_alert_screen_darken);
screen_darken.depth = -11-2*state;

player_controller = instance_find(o_player_controller,0);
current_player = player_controller.players[player_controller.active_player];

x = view_get_wport(0)/2;
y = view_get_hport(0)*2/5;
image_xscale = 2;
image_yscale = 2;
var bb;
var _x = -36;
var _y = 12;
var s = "";

for(var i = 0; i < 3; i++)
{
	bb = instance_create_layer(x+(_x + 24*i)*2,y-(_y)*2,"GUI",o_alert_choose_ship_button);
	bb.image_xscale = 2;
	bb.image_yscale = 2;
	bb.image_index = i;
	bb.depth -= state;
	switch (i)
	{
		case 0:
		s = "Interceptor";
		break
		case 1:
		s = "Cruiser";
		break
		case 2:
		s = "Dreadnought";
		break;
	}
	bb.ship_name = s;
	bb.class = i;
	my_buttons[i] = bb;
}

_x = -51;
_y = -32;

bb = instance_create_layer(x+(_x)*2,y-(_y)*2,"GUI",o_alert_yes);
bb.image_xscale = 2;
bb.image_yscale = 2;
bb.image_index = 0;
bb.depth -= state;
my_buttons[i++] = bb;

_x = 38;
_y = 35;

bb = instance_create_layer(x+(_x)*2,y-(_y)*2,"GUI",o_alert_x);
bb.image_xscale = 2;
bb.image_yscale = 2;
bb.image_index = 0;
bb.depth -= state;
my_buttons[i] = bb;

do_function = function(variable)
{
	var ships = variable.ships;
	var ship_classes = [0,0,0];
	for(var i = 0; i < array_length(ships); i++)
		if(ships[i].player == current_player.player && ships[i].class < 3)
			ship_classes[ships[i].class]++;
			
	for(var i = 0; i < 3; i++)
		if(ship_classes[i] == 0)
			instance_destroy(my_buttons[i]);

	for(var i = 0; i < array_length(my_buttons)-2; i++)
		if(!instance_exists(my_buttons[i]))
			array_delete(my_buttons,i--,1);
}