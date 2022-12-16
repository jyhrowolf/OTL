/// @description Clicked On Me
if(clickable && my_attribute != noone)
{
	var controller = instance_find(o_setup_controller,0);
	var value = controller.attributes[my_attribute].attribute_value;
	var bounds = controller.attributes_bounds;
	if(bounds[my_attribute][0] <= value + (-image_index*2 + 3) && bounds[my_attribute][1] >= value + (-image_index*2 + 3))
		controller.attributes[my_attribute].attribute_value += (-image_index*2 + 3);
}
else if (my_attribute == noone)
{
	var controller = instance_find(o_setup_controller,0);
	controller.alarm[0] = 1;
}