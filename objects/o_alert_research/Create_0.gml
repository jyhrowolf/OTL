/// @description Settup research alert

// Inherit the parent event
event_inherited();
screen_darken = instance_create_layer(0,0,"GUI",o_alert_screen_darken);
screen_darken.depth = -11;

var research_controller = instance_find(o_research_controller,0);
available_research = research_controller.available_research;

player_controller = instance_find(o_player_controller,0);
current_civ = player_controller.players[player_controller.active_player].civilization;

x = view_get_wport(0)/2;
y = view_get_hport(0)*2/5;
image_xscale = 3;
image_yscale = 3;
var bb;
var b_index = 0;
var _x = -114;
var _y = -46;
var discount = 0;
for(var i = 0; i < array_length(available_research)-1; i++)
{
	var discount = current_civ.research.discount[i];
	for(var j = 0; j < array_length(available_research[i]); j++)
	{
		bb = instance_create_layer(x+(_x)*3,y-(_y + 23*(4-i))*3,"GUI",o_alert_research_display);
		bb.image_xscale = 3;
		bb.image_yscale = 3;
		bb.generate_research(available_research[i][j]);
		if(array_length(available_research[i]) > j +1)
			if(available_research[i][j] == available_research[i][j+1]) // skip duplicates
				j++;
		bb.expected_cost = (bb.cost - discount)*(discount <= bb.cost - bb.discount) + bb.discount*(discount > bb.cost - bb.discount);

		if(array_length(current_civ.research.researched[bb.class]) < 7)
			bb.buyable = (current_civ.resources[1] - bb.expected_cost >= 0) && current_civ.check_research(bb.research);
		else
			bb.buyable = false;

		my_buttons[b_index++] = bb;
	}
}
discount = max(current_civ.research.discount[0] * (array_length(current_civ.research.researched[0]) < 7),
				current_civ.research.discount[1]* (array_length(current_civ.research.researched[1]) < 7),
				current_civ.research.discount[2]* (array_length(current_civ.research.researched[2]) < 7));
for(var j = 0; j < array_length(available_research[i]); j++) // rare
{
	bb = instance_create_layer(x+(_x+21*j)*3,y-(_y + 23*(4-i))*3,"GUI",o_alert_research_display);
	bb.image_xscale = 3;
	bb.image_yscale = 3;
	bb.generate_research(available_research[i][j]);
	
	bb.expected_cost = (bb.cost - discount)*(discount <= bb.cost - bb.discount) + bb.discount*(discount > bb.cost - bb.discount);
	bb.buyable = (current_civ.resources[1] - bb.expected_cost >= 0) && current_civ.check_research(bb.research);
	my_buttons[b_index++] = bb;
}

_x = -51;
_y = -72;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_yes);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[b_index++] = bb;

_x = 124;
_y = 80;

bb = instance_create_layer(x+(_x)*3,y-(_y)*3,"GUI",o_alert_x);
bb.image_xscale = 3;
bb.image_yscale = 3;
bb.image_index = 0;
my_buttons[b_index] = bb;

text_color = [];
text_color[0] = #e65abe;
text_color[1] = #5ae6a0;
text_color[2] = #c5e65a;
text_color[3] = #3f4a55;

do_function = function(variable)
{
	if(variable == "cheapest")
	{
		state = global.mouse_state;
		var min_cost = 16;
		for(var i = 0; i < array_length(my_buttons)-2; i++)
			if(current_civ.check_research(my_buttons[i].research))
				if(my_buttons[i].expected_cost <= min_cost)
				{
					min_cost = my_buttons[i].expected_cost;
					my_buttons[i].buyable = true;
				}
		for(var i = 0; i < array_length(my_buttons)-2; i++)
			if(my_buttons[i].expected_cost != min_cost)
				my_buttons[i].buyable = false;
	}
}