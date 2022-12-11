/// @description Draw GUI
draw_self();

var _c = #161616;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_gui_large);
var _x = (0)*3;
var _y = (-42)*3;

draw_text_color(x+_x,y-_y,string(trade) + " = 1",
					_c,_c,_c,_c,1);

_x = (-28)*3;
_y = (-3)*3;

for(var i = 0; i < 3; i++)
{
	if(my_buttons[i].highlighted == 2)
		draw_sprite_ext(s_alert_trade_show,i,x+_x,y+_y,3,3,0,c_white,1);
	else if(my_buttons[i].highlighted == 1)
		draw_sprite_ext(s_alert_trade_show,i,x+_x+(15+2+22+2)*3,y+_y,3,3,0,c_white,1);
}