/// @description Settup trade alert

// Inherit the parent event
event_inherited();
screen_darken = instance_create_layer(0,0,"GUI",o_alert_screen_darken);
screen_darken.depth = -11;

var player_controller = instance_find(o_player_controller,0);
current_player = player_controller.players[player_controller.active_player];
trade = current_player.civilization.trade;

x = view_get_wport(0)/2;
y = view_get_hport(0)*2/5;
image_xscale = 3;
image_yscale = 3;
var bb;
var _x = -32;
var _y = 34;
for(var i = 0; i < 3; i++)
{
	bb = instance_create_layer(x+(_x + 21*i)*3,y-(_y)*3,"GUI",o_alert_trade_button);
	bb.image_xscale = 3;
	bb.image_yscale = 3;
	bb.image_index = i;
	bb.alert_trade = self;
	my_buttons[i] = bb;
}

my_buttons[0].update_depth(1);
my_buttons[1].update_depth(2);
my_buttons[2].update_depth(0);

_x = -51;
_y = -53;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_yes);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[i++] = bb;

_x = 34;
_y = 57;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_x);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[i] = bb;
