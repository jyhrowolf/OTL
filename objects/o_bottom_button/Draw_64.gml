/// @description Draw Button
draw_self();

var pc = player_controller; //draw bits for influence
var inf = pc.players[pc.active_player].civilization.influence_spent[image_index-1];
var _color = pc.players[pc.active_player].species.faction_color;
var _x = 0
var _y = 0;
for(var i = 0; i < inf; i++)
{
	_x = x + (12)*2 + (36*(floor(i / 4)))*2;
	_y = y + (-5 + 5*(i%4))*2;
	draw_sprite_ext(s_influence_bit,0,_x,_y,2,2,0,_color,1);
}
var _c = #161616;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_gui_medium);
_x = (31)*2;
_y = (-23)*2 + 1;

draw_text_color(x+_x,y-_y,string(pc.players[pc.active_player].civilization.influence_action[image_index-1]),
					_c,_c,_c,_c,1);