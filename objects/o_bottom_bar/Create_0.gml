/// @description Create the smaller buttons
top_bar = instance_find(o_top_bar,0);

gc = instance_find(o_game_controller,0);
gc.bottom_bar = self;

my_buttons = [];
var i = 0;
var _x = 48;
var _y = 40;

var bb = instance_create_layer(x+(_x + 68*i)*3,y-(_y)*3,"GUI",o_bottom_button); //Explore
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i] = bb;
bb.image_index = ++i;

bb = instance_create_layer(x+(_x + 68*i)*3,y-(_y)*3,"GUI",o_bottom_button);
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i] = bb;
bb.image_index = ++i;

bb = instance_create_layer(x+(_x + 68*i)*3,y-(_y)*3,"GUI",o_bottom_button);
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i] = bb;
bb.image_index = ++i;

_x = 392;

bb = instance_create_layer(x+(_x + 68*(i-3))*3,y-(_y)*3,"GUI",o_bottom_button); //Build
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i] = bb;
bb.image_index = ++i;

bb = instance_create_layer(x+(_x + 68*(i-3))*3,y-(_y)*3,"GUI",o_bottom_button);
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i] = bb;
bb.image_index = ++i;

bb = instance_create_layer(x+(_x + 68*(i-3))*3,y-(_y)*3,"GUI",o_bottom_button);
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i] = bb;
bb.image_index = ++i;

_x = 269
_y = 38

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_bottom_end_cancel);
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i++] = bb;
bb.image_index = 0;

_y = 42;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_bottom_info);
bb.image_xscale = 3;
bb.image_yscale = 3;
my_buttons[i] = bb;
bb.image_index = 0;