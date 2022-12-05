// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_applied_traits(trait_list,_check){
	var applied_traits = [];
	array_copy(applied_traits,0,trait_list,0,array_length(trait_list));
	for(var i = 0; i < array_length(applied_traits);i++) // get only the traits that apply to exploration
	{
		var b = false;
		for(var j = 0; j < array_length(applied_traits[i].application);j++)
			if(applied_traits[i].application[j] == _check)
			{
				b = true;
				break;
			}
		if(!b)
			array_delete(applied_traits,i--,1);
	}
	return applied_traits;
}