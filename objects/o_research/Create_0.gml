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
		if(discount[i] == 5)
			discount[i] = 6;
		else if(discount[i] == 6)
			discount[i] = 8;
		victory_points[i] = array_length(researched[i]) - 4;
		if(victory_points[i] < 0)
			victory_points[i] = 0;
	}
}

calculate_research_victory_points = function()
{
	var sum = 0;
	for(var i = 0; i < 3; i++)
	{
		var len = array_length(researched[i]);
		switch(len)
		{
			case 4:
				sum += 1;
				break;
			case 5:
				sum += 2;
				break;
			case 6:
				sum += 3;
				break;
			case 7:
				sum += 5;
				break;
		}
	}
	return sum;
}