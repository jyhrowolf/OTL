/// @description Clicked On Me
if(clickable && my_attribute != noone)
{
	var controller = instance_find(o_setup_controller,0);
	var value = controller.attributes[my_attribute].attribute_value;
	var bounds = controller.attributes_bounds;
	if(bounds[my_attribute][0] <= value + button_mod && bounds[my_attribute][1] >= value + button_mod)
		controller.attributes[my_attribute].attribute_value += button_mod;
}
else if (my_attribute == noone)
{
	var controller = instance_find(o_setup_controller,0);
	controller.alarm[0] = 1;
}