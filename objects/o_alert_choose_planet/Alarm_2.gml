/// @description Check if its an orbital and delete material
if(variable.resource == 4)
{
	instance_destroy(my_buttons[2]);
	array_delete(my_buttons,2,1);
}