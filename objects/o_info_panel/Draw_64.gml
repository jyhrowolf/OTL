/// @description Draw self
draw_self();
if(civilization.icon != noone)
	draw_sprite_ext(civilization.icon,0,x+6*3,y+6*3,3,3,0,c_white,1);

for(var i = 0; i < array_length(research.researched); i++)
{
	for(var j = 0; j < array_length(research.researched[i]); j++)
	{
		var researchs = research.researched[i][j];
		var class = researchs.class;
		var index = 0;
		var s = string_digits(object_get_name(researchs.object_index));
		if(s >= 300)
		{
			index = s % 100;
		}
		else
		{
			index = s % 10;
		}
		draw_sprite_part_ext(asset_get_index("s_alert_research_tokens_"+string(class)),index,
								3,3,15,15,x+(j*16 + 9) *3,y+(i*16 + 70) * 3,3,3,c_white,1);
	}
}

var t = 0;
for(var i = 0; i < species.rep_track[1]; i++)
{
	draw_sprite_ext(s_rep_track,1,x+(t++*16 + 9) *3,y+(121) * 3,3,3,0,c_white,1);
}
for(var i = 0; i < species.rep_track[2]; i++)
{
	draw_sprite_ext(s_rep_track,2,x+(t++*16 + 9) *3,y+(121) * 3,3,3,0,c_white,1);
}
for(var i = 0; i < species.rep_track[0]; i++)
{
	draw_sprite_ext(s_rep_track,0,x+(t++*16 + 9) *3,y+(121) * 3,3,3,0,c_white,1);
}
t = 0;
for(var i = 0; i < array_length(civilization.rep_track); i++)
{
	var nm = object_get_name(civilization.rep_track[i].object_index);
	if(nm == "o_exp_combat")
	{
		draw_sprite_ext(s_rep_token,civilization.rep_track[i].victory_points-1,x+(t++ * 16 + 9 + 16*species.rep_track[1]) *3,y+(121) * 3,3,3,0,c_white,1);
	}
}

var str = "Round: " + string(round_count + 1) + "      ";

var _c = #161616;
var _x = (69)*3 - 1;
var _y = (-8)*3 - 1;
		
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(f_gui_medium);

var s_w = (52*3)/string_width_ext(str,17,52*3);
var s_h = (11*3)/string_height_ext(str,17,52*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);

str = "Player: " + string(player) + "     ";

_x = (69)*3 - 1;
_y += (-7)*3;

s_w = (52*3)/string_width_ext(str,17,52*3);
s_h = (11*3)/string_height_ext(str,17,52*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);

str = "Exploration: " + string(victory_points[0]) + "";

_x = (69)*3 - 1;
_y += (-7)*3;

s_w = (52*3)/string_width_ext(str,17,52*3);
s_h = (11*3)/string_height_ext(str,17,52*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);

str = "Systems: " + string(victory_points[1]) + "";

_x = (69)*3 - 1;
_y += (-7)*3;

s_w = (52*3)/string_width_ext(str,17,52*3);
s_h = (11*3)/string_height_ext(str,17,52*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);

str = "Research: " + string(victory_points[2]) + "";

_x = (69)*3 - 1;
_y += (-7)*3;

s_w = (52*3)/string_width_ext(str,17,52*3);
s_h = (11*3)/string_height_ext(str,17,52*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);
					
str = "Reputation: " + string(victory_points[3]) + "";

_x = (69)*3 - 1;
_y += (-7)*3;

s_w = (52*3)/string_width_ext(str,17,52*3);
s_h = (11*3)/string_height_ext(str,17,52*3*s_w);

draw_text_ext_transformed_color(x+_x,y-_y,str,17,52*3*2,
					min(s_w,s_h), min(s_w,s_h),
					0,_c,_c,_c,_c,1);