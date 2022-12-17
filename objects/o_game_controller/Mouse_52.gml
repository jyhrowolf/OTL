/// @description Insert description here

var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);


if(mouse_pos[0] != 0 || mouse_pos[1] != 0)
{
	var c_width = camera_get_view_width(view_camera[0]);
	var c_height = camera_get_view_height(view_camera[0]);
	var c_angle = camera_get_view_angle(view_camera[0]);
	
	var m_dir = -point_direction(mouse_pos[0],mouse_pos[1],m_x,m_y) + c_angle;
	var m_mag = -point_distance(mouse_pos[0],mouse_pos[1],m_x,m_y)/2;
	
	var x_dif = m_mag*dcos(m_dir);
	var y_dif = m_mag*dsin(m_dir);
	
	camera_set_view_pos(view_camera[0],selected_hex.x-c_width/2 + x_dif,
					selected_hex.y-c_height/2 + y_dif);
}
else
{
	mouse_pos = [m_x,m_y];
}
