/// @description Yes button
if(choice > -1)
{
	current_player.civilization.add_exploration(variable,choice);
	instance_destroy(self);
}