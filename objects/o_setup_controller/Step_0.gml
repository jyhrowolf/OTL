/// @description handle player number
for(var i = 9; i < array_length(attributes); i++)
{
	for(var j = 0; j < array_length(buttons); j++)
	{
		if(buttons[j].my_attribute == i)
		{
			if(i < 9+attributes[0].attribute_value)
				instance_activate_object(buttons[j]);
			else
				instance_deactivate_object(buttons[j]);
		}
	}
	if(i < 9+attributes[0].attribute_value)
		instance_activate_object(attributes[i]);
	else
		instance_deactivate_object(attributes[i]);
	
}
