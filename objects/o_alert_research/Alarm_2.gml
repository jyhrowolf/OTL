/// @description Re calc stuff
for(var i = 0; i < array_length(my_buttons)-2; i++)
{
	var bb = my_buttons[i];
	var discount = max(current_civ.research.discount[0] * (array_length(current_civ.research.researched[0]) < 7),
				current_civ.research.discount[1]* (array_length(current_civ.research.researched[1]) < 7),
				current_civ.research.discount[2]* (array_length(current_civ.research.researched[2]) < 7));
	if(bb.class < 3)
		discount = current_civ.research.discount[bb.class];
	
	bb.expected_cost = (bb.cost - discount)*(discount <= bb.cost - bb.discount) + bb.discount*(discount > bb.cost - bb.discount);
	if(bb.class < 3)
	{
		if(array_length(current_civ.research.researched[bb.class]) < 7)
			bb.buyable = (current_civ.resources[1] - bb.expected_cost >= 0) && current_civ.check_research(my_buttons[i].research);
		else
			bb.buyable = false;
	}
	else
		bb.buyable = (current_civ.resources[1] - bb.expected_cost >= 0) && current_civ.check_research(my_buttons[i].research);
}