/// @description Settup choose planet alert

// Inherit the parent event
event_inherited();
screen_darken = instance_create_layer(0,0,"GUI",o_alert_screen_darken);
screen_darken.depth = -11;

player_controller = instance_find(o_player_controller,0);
current_player = player_controller.players[player_controller.active_player];

x = view_get_wport(0)/2;
y = view_get_hport(0)*2/5;
image_xscale = 3;
image_yscale = 3;
var bb;
var _x = -32;
var _y = 12;

for(var i = 0; i < 3; i++)
{
	bb = instance_create_layer(x+(_x + 21*i)*3,y-(_y)*3,"GUI",o_alert_choose_planet_button);
	bb.image_xscale = 3;
	bb.image_yscale = 3;
	bb.image_index = i;
	my_buttons[i] = bb;
}
my_buttons[0].highlighted = 1;

_x = -51;
_y = -32;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_yes);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[i++] = bb;

_x = 38;
_y = 35;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_x);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[i] = bb;

do_function = function(variable)
{
	if(variable.resource == 4)
	{
		instance_destroy(my_buttons[2]);
		array_delete(my_buttons,2,1);
	}
}
//alarm[2] = 1;