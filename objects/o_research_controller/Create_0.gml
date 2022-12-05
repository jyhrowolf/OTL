/// @description Initiallize research
delete_research = function(_research)
{
	for(var i = 0; i < array_length(available_research);i++)
		for(var j = 0; j < array_length(available_research[i]);j++)
			if(object_get_name(_research.object_index) == "o_research_" + string(available_research[i][j]))
			{
				array_delete(available_research[i],j,1);
				
				return true;
			}
	return false;
}
