/// @description settup research
add_research = function(_research_trial)
{
	array_push(researched[_research_trial.class],_research_trial);
	calculate_discount();
}

add_rare_research = function(_research_trial,index)
{
	array_push(researched[index],_research_trial);
	calculate_discount();
}
calculate_discount = function()
{
	for(var i = 0; i < 3; i++)
	{
		discount[i] = array_length(researched[i]);
		if(discount[i] == 7)
			discount[i] = 8;
		victory_points[i] = array_length(researched[i]) - 4;
		if(victory_points[i] < 0)
			victory_points[i] = 0;
	}
}
