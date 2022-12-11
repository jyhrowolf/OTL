/// @description Draw GUI
draw_self();

var _c = #161616;
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(f_gui_large);
				
var _x = (-29)*3;
var _y = (-21)*3;

var s_w = (58*3)/string_width(ship_name);
var s_h = (11*3)/string_height(ship_name);

draw_text_transformed_color(x+_x,y-_y,ship_name,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);
