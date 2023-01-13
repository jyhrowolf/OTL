/// @description Draw GUI
draw_self();

var _c = #161616;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(f_gui_medium);
var _x = (-270)*3;
var _y = (-25)*3+1;
var gap = string_height("ll")/4-1;

for(var i = 0; i < array_length(equipment); i++)
{
	var weap = false;
	var s = ""
	switch (equipment[i][0])
	{
		case 0:
			s = "Hull";
		break;
		case 1:
			s = "Drive";
		break;
		case 2:
			s = "Source";
		break;
		case 3:
			s = "Computer";
		break;
		case 4:
			s = "Shots";
			weap = true;
		break;
		case 5:
			s = "Missiles";
			weap = true;
		break;
		case 6:
			s = "Shields";
		break;
		case 7:
			s = "Initiative";
		break;
	}
	s += ": ";
	draw_text_color(x+_x,y-(_y - gap*i*3),s + string(equipment[i][1]),
					_c,_c,_c,_c,1);
	if(weap)
		draw_text_color(x+_x,y-(_y - gap*(++i)*3),"Damage: " + string(equipment[i][2]),
					_c,_c,_c,_c,1);
}
				
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(f_gui_medium);
				
_x = (-58)*3 + 1;
_y = (-89)*3 + 1;

var s_w = (90*3)/string_width_ext(upgrade_name,17,90*3);
var s_h = (11*3)/string_height_ext(upgrade_name,17,90*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,upgrade_name,17,90*3*s_w,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(f_gui_medium);

_x = (171)*3 + 1;
_y = (-29)*3 + 1;
draw_text_color(x+_x,y-_y,"Changes: " + string(changes),_c,_c,_c,_c,1);