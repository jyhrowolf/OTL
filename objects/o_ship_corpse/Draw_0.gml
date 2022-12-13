/// @description Draw Stuff
var rot = direction - 90;
var _c = dcos(rot);
var _s = dsin(rot);
var _x = surface_dim[0] / 2;  //surface origin x
var _y = surface_dim[1] / 2;  //surface origin y
draw_surface_ext(surf,x - _c * _x - _s * _y, y - _c * _y + _s * _x,1,1,rot,c_white,1);