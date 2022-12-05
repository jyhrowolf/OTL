/// @description Clean map
var list = [];
ds_map_values_to_array(map,list);
for(var i = 0; i < array_length(list); i++)
{
	var hex = list[i];
	if(hex.highlighted)
	{
		hex.highlighted = false;
		if(!hex.explored)
			hex.depth = hex.tier + 2;
		else
			hex.depth = 3;
	}
}