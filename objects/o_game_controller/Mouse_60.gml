/// @description Handle zoom in
var change = .1;
var pc = player_controller;
if(pc.action >= 0 && global.mouse_state < 1) //interact with map
{
	switch (pc.action)
	{
		case 0: //zoom in
			zoom_camera(pc,change,selected_hex);
		break;
		case 1: //zoom in
			zoom_camera(pc,change,selected_hex);
		break;
		case 5: //zoom in
			zoom_camera(pc,change,selected_hex);
		break;
	}
}