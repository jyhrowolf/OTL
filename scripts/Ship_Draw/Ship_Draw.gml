// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_shield(surf_dim,_class)
{
	var _c = #1a1a1a;
	if(_class >= 0)
	{
		draw_set_alpha(0.25);
		draw_ellipse_color(0,0,surf_dim[0]-2,surf_dim[1]-1,_c,_c,false);
		draw_set_alpha(1);
		draw_ellipse_color(0,0,surf_dim[0]-2,surf_dim[1]-1,_c,_c,true);
	}
}