/// @description Draw Stuff
image_angle += angle_difference(direction,image_angle) * 0.1 /(class + 1) *((complete != 0)+1);

var rot = image_angle - 90 + (5 + 5 * (class+1))*((complete == 0));
var _c = dcos(rot);
var _s = dsin(rot);
var _x = surface_dim[0] / 2;  //surface origin x
var _y = surface_dim[1] / 2;  //surface origin y
draw_surface_ext(surf,x - _c * _x - _s * _y, y - _c * _y + _s * _x,1,1,rot,c_white,1);