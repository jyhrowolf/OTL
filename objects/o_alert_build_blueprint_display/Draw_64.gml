/// @description Draw stuff
draw_self();
if(hovered)
{
	if(buildable < 4)
		draw_rectangle_width(x,y,x+sprite_width-2,y+sprite_height-2,2,#898989);
	else
		draw_sprite_ext(s_blueprint_clean_other_border,(buildable >= 5),x,y,2,2,0,c_white,1);
}

var _c = #1d2336;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_gui_upgrade);

var _x = (11)*2;
var _y = -(sprite_height-(10)*2);
if(buildable == 4)
	_y += 12;

draw_sprite_ext(s_blueprint_upgrade_weapon_box,0,x+_x,y-_y,2,2,0,c_white,image_alpha);
draw_text_color(x+_x,y-_y,string(cost),_c,_c,_c,_c,image_alpha);

if(ships > -1)
{
	 _x = sprite_width-(12)*2 -1;
	 _y = -(sprite_height-(10)*2);
	if(buildable == 4)
		_y += 12;

	draw_sprite_ext(s_blueprint_upgrade_weapon_box,0,x+_x,y-_y,2,2,0,c_white,image_alpha);
	draw_text_color(x+_x,y-_y,string(ships),_c,_c,_c,_c,image_alpha);
}
