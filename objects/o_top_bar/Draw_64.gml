/// @description Draw GUI
draw_self();
//draw influence
var pc = instance_find(o_player_controller,0);
var player = pc.players[pc.active_player];
var _x = 12;
var _y = -3;
for(var i = 0; i < 13; i++)
{
	draw_sprite_ext(s_top_influence,1,x+(_x + i*21)*2,y-_y*2,2,2,0,c_white,1);
	if(i < player.civilization.influence)
		draw_sprite_ext(s_top_influence,0,x+(_x + i*21)*2,y-_y*2,2,2,0,player.species.faction_color,1);
}