/// @description Ship start path
var pos = path_position;
x -= path_get_x(orbit_path,path_position) - path_get_x(orbit_path,1);
y -= path_get_y(orbit_path,path_position) - path_get_y(orbit_path,0);
path_start(orbit_path,path_speed,path_action_continue,false);
path_position = pos;
complete = 0;
alarm[0] = 1+class;