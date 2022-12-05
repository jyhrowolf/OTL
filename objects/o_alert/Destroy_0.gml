/// @description Destroy everything
instance_destroy(screen_darken);
for(var i = 0; i < array_length(my_buttons); i++)
	instance_destroy(my_buttons[i]);
var ac = instance_find(o_alert_controller,0);
ac.next_alert(noone);