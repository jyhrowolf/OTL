/// @description Darken buttons
for(var i = 0; i < array_length(my_buttons); i++)
	if(gc.player_controller.action_taken && i <= 5)
		my_buttons[i].image_alpha = 0.6;
	else
		my_buttons[i].image_alpha = 1.0;