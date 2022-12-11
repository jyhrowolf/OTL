/// @description Create the smaller buttons
bottom_bar = instance_find(o_bottom_bar,0);

gc = instance_find(o_game_controller,0);
gc.top_bar = self;

my_labels = [];
var _x = 4;
var _y = -23;
var i = 0;

var ll = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_top_label); //Money
ll.image_xscale = 3;
ll.image_yscale = 3;
my_labels[i] = ll;
ll.image_index = ++i;
_x += 115;

ll = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_top_label);
ll.image_xscale = 3;
ll.image_yscale = 3;
my_labels[i] = ll;
ll.image_index = ++i;
_x += 87;

ll = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_top_label);
ll.image_xscale = 3;
ll.image_yscale = 3;
my_labels[i] = ll;
ll.image_index = ++i;

i = 0;
_x = 534
_y = -5

var bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_top_colony);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[i++] = bb;

var bb = instance_create_layer(x+(_x)*3,y-(_y - 24)*3,"GUI",o_top_trade);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[i++] = bb;