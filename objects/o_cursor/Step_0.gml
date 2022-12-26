/// @description Move to mouse

x = device_mouse_x_to_gui(0);
y = device_mouse_y_to_gui(0);
if(global.mouse_state >= 1)
	image_index = 1;
else
	image_index = 0;