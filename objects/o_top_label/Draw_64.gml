/// @description Draw self
draw_self();
if(chosen)
	draw_sprite_ext(s_top_labels_choice,image_index-1,x,y,2,2,0,c_white,1);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(f_gui_large);

var _c = #161616;
draw_text_color(x+(47)*2,y+(4)*2,string(resource),_c,_c,_c,_c,1);
_c = #001600;
draw_text_color(x+(75)*2,y+(4)*2,string(income),_c,_c,_c,_c,1);
if(image_index == 1)
{
	_c = #160000;
	draw_text_color(x+(103)*2,y+(4)*2,string(upkeep),_c,_c,_c,_c,1);
}