/// @description Draw GUI
draw_self();

var _c = #161616;
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(f_gui_large);
var _x = (57)*3 - 1;
var _y = (-65)*3;

draw_text_color(x+_x,y-_y,string(expected_cost),
					_c,_c,_c,_c,1);
				
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(f_gui_medium);
				
_x = (-58)*3 + 1;
_y = (-62)*3 + 1;

var s_w = (90*3)/string_width_ext(research_name,17,90*3);
var s_h = (11*3)/string_height_ext(research_name,17,90*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,research_name,17,90*3*s_w,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);
