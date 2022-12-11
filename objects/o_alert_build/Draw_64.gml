/// @description Draw GUI
draw_self();

var _c = #161616;
				
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(f_gui_medium);
				
var _x = (-58)*3 + 1;
var _y = (-90)*3;

var s_w = (90*3)/string_width_ext(blueprint_name,17,90*3);
var s_h = (11*3)/string_height_ext(blueprint_name,17,90*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,blueprint_name,17,90*3*s_w,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);

