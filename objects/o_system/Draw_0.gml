/// @description Draw Hex
draw_self();
if(explored)
	for(var i = 0; i < 6; i++)
	{
		if(layout[i])
		{
			draw_sprite_ext(s_warp_tunnel, 0, x+45*cos(-pi/3*i + pi/6), y+45*sin(-pi/3*i+pi/6),
							1, 1, (pi/3*i+pi/3)*180/pi, c_white, 1);
		}
	}
