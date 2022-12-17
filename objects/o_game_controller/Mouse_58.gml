/// @description Insert description here
// You can write your code in this editor

var c_width = camera_get_view_width(view_camera[0]);
var c_height = camera_get_view_height(view_camera[0]);
camera_set_view_pos(view_camera[0],selected_hex.x-c_width/2,selected_hex.y-c_height/2);

mouse_pos = [0,0];