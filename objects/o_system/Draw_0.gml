/// @description Draw Hex
if(explored)
{
	if(exploration_token != noone)
		draw_system_token(self,c_grey);
	if(player > 0)
		draw_system(self,c_white);
	else
	{
		draw_system(self,c_grey);
		if(enemy != noone)
			draw_system_enemy(self,enemy,neutrals); //enemy tokens
	}
	draw_system_warp_tunnels(self);
	if(highlighted)
		draw_highlight_system(self);
}
else if (explorable)
{
	draw_empty_system(self);
	if(highlighted)
		draw_highlight_system(self);
}
