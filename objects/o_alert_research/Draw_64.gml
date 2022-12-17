/// @description Draw GUI
draw_self();
var _x = (60)*3;
var _y = (55)*3;

var _c;
var s_w;
var s_h;
if(selected_button != -1 && instance_exists(my_buttons[selected_button]))
{
	var bb = my_buttons[selected_button];
	draw_sprite_ext(s_alert_research_panel,bb.class,x+_x,y-_y,3,3,0,c_white,1);
	
	_c = text_color[bb.class];
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(f_gui_small);

	var str = bb.research_name;
	_x += (4)*3;
	_y -= (13)*3 - 2;
	
	s_w = (71*3)/string_width_ext(str,-1,-1);
	s_h = (11*3)/string_height_ext(str,-1,-1);
	
	draw_text_ext_transformed_color(x+_x,y-_y,str,17,71*3/min(s_w,s_h),
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);
					
	str = "-----------------------";

	_y -= (6)*3 - 2;

	s_w = (71*3)/string_width_ext(str,17,71*3);
	s_h = (11*3)/string_height_ext(str,17,71*3*s_w);

	draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
						min(s_w,s_h), min(s_w,s_h),
						0,_c,_c,_c,_c,1);
	switch(bb.type)
	{
		case 0: // 0, 1, 2, 3, - Ship Part, Build, Instant, Permanent
			str = "Ship Part";
			break;
		case 1:
			str = "Build Unlock";
			break;
		case 2:
			str = "Instant Effect";
			break;
		case 3:
			str = "Permanent Effect";
			break;
	}

	_y -= (6)*3 - 1;

	s_w = (71*3)/string_width_ext(str,-1,-1);
	s_h = (11*3)/string_height_ext(str,-1,-1);

	draw_text_ext_transformed_color(x+_x,y-_y,str,17,71*3,
						min(s_w,s_h), min(s_w,s_h),
						0,_c,_c,_c,_c,1);
						
	str = "-----------------------";

	_y -= (7)*3 - 2;

	s_w = (71*3)/string_width_ext(str,17,71*3);
	s_h = (11*3)/string_height_ext(str,17,71*3*s_w);

	draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
						min(s_w,s_h), min(s_w,s_h),
						0,_c,_c,_c,_c,1);
						
	str = bb.description;
	
	_y -= (6)*3;

	draw_text_ext_transformed_color(x+_x,y-_y,str,11,71*3/min(s_w,s_h),
						min(s_w,s_h), min(s_w,s_h),
						0,_c,_c,_c,_c,1);
	
}


_c = #161616;
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(f_gui_large);
_x = (97)*3;
_y = (-65)*3;

draw_text_color(x+_x,y-_y,string(expected_cost),
					_c,_c,_c,_c,1);
				
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(f_gui_medium);
				
_x = (-100)*3 + 1;
_y = (-62)*3 + 1;

s_w = (172*3)/string_width_ext(research_name,17,172*3);
s_h = (11*3)/string_height_ext(research_name,17,172*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,research_name,17,172*3*s_w,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);
