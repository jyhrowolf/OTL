/// @description Draw Gui
draw_sprite_ext(s_alert_research_tokens_back,back_image_index,x,y,3,3,0,c_white,1);
draw_self();

var _c = text_color[class];

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(f_gui_small);

var _x = (8)*3;
var _y = (-17)*3-2;

draw_text_color(x+_x,y-_y,string(cost),_c,_c,_c,_c,image_alpha);

_x = (13)*3;

draw_text_color(x+_x,y-_y,string(discount),_c,_c,_c,_c,image_alpha);

if(buyable)
{
	draw_sprite_ext(s_alert_research_highlight,4,x,y,3,3,0,c_white,1);
	draw_sprite_ext(s_alert_research_highlight,class,x,y,3,3,0,c_white,image_alpha);
}