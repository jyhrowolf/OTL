/// @description Re calc stuff
for(var i = 0; i < array_length(my_buttons)-2; i++)
{
	var bb = my_buttons[i];
	var discount = max(current_civ.research.discount[0],current_civ.research.discount[1],current_civ.research.discount[2]);
	if(bb.class < 3)
		discount = current_civ.research.discount[bb.class];
	
	bb.expected_cost = (bb.cost - discount)*(discount <= bb.cost - bb.discount) + bb.discount*(discount > bb.cost - bb.discount);
	bb.buyable = (current_civ.resources[1] - bb.expected_cost >= 0) && current_civ.check_research(my_buttons[i].research);
}