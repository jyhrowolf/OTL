/// @description Create Map
hex_width = 104;
hex_height = 90;
// move camera to center
var c_width = camera_get_view_width(view_camera[0]);
var c_height = camera_get_view_height(view_camera[0]);
camera_set_view_pos(view_camera[0],-c_width/2,-c_height/2);
map[? map_hash([0,0])] = instance_create_layer(0,0,"Map",o_system);