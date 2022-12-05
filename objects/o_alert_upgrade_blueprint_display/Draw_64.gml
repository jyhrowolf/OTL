/// @description Draw stuff
draw_self();
for(var i = 0; i < array_length(ship_parts); i++)
{
	if(ship_parts[i] != noone)
	{
		draw_sprite_ext(ship_parts[i].sprite_index,ship_parts[i].image_index,
						x+(ship_parts_pos[i][0])*2,y-(ship_parts_pos[i][1])*2,2,2,0,c_white,image_alpha);
	}
}
if(hovered)
	draw_rectangle_width(x,y,x+sprite_width-2,y+sprite_height-2,2,#898989);

var _c = #1d2336;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_gui_upgrade);
draw_set_alpha(image_alpha);

i = 0;
var gap = 15;
var _x = (11)*2;
var _y = -(sprite_height-(gap*4+5)*2) - 21;

var weap = 0;
for(var w = 0; w < array_length(weapons); w++)
{
	if(weapons[w] > 0)
	{
		_c = text_color_weapon[w-1];
		draw_sprite_ext(s_blueprint_upgrade_weapon_box,w,x+_x+weap*gap*2,y-_y+i*gap*2-1,2,2,0,c_white,image_alpha);
		draw_text_color(x+_x+weap++*gap*2,y-_y + i*gap*2,"x"+string(weapons[w]),_c,_c,_c,_c,image_alpha);
	}
}
i++;
weap = 0;
for(var w = 0; w < array_length(missiles); w++)
{
	if(missiles[w] > 0)
	{
		_c = text_color_weapon[w-1];
		draw_sprite_ext(s_blueprint_upgrade_weapon_box,w,x+_x+weap*gap*2,y-_y+i*gap*2-1,2,2,0,c_white,image_alpha);
		draw_text_color(x+_x+weap++*gap*2,y-_y + i*gap*2,"x"+string(missiles[w]),_c,_c,_c,_c,image_alpha);
	}
}
i++;

_c = text_color[3];
draw_sprite_ext(s_blueprint_upgrade_box,3,x+_x,y-_y+i*gap*2-1,2,2,0,c_white,image_alpha);
draw_text_color(x+_x,y-_y + i++*gap*2,"+"+string(computer),_c,_c,_c,_c,image_alpha);

_c = text_color[4];
draw_sprite_ext(s_blueprint_upgrade_box,4,x+_x,y-_y+i*gap*2-1,2,2,0,c_white,image_alpha);
draw_text_color(x+_x,y-_y + i++*gap*2,"-"+string(shield),_c,_c,_c,_c,image_alpha);

i = 0;
_x = (sprite_width - 11*2) - 1;
_y = -(sprite_height-(gap*3+5)*2) - 21;

_c = text_color[i];
draw_sprite_ext(s_blueprint_upgrade_box,i,x+_x-1,y-_y+i*gap*2-1,2,2,0,c_white,image_alpha);
draw_text_color(x+_x,y-_y + i++*gap*2,string(hull),_c,_c,_c,_c,image_alpha);

_c = text_color[i];
draw_sprite_ext(s_blueprint_upgrade_box,i,x+_x-1,y-_y+i*gap*2-1,2,2,0,c_white,image_alpha);
draw_text_color(x+_x,y-_y + i++*gap*2,string(drive),_c,_c,_c,_c,image_alpha);

_c = text_color[i];
draw_sprite_ext(s_blueprint_upgrade_box,i,x+_x-1,y-_y+i*gap*2-1,2,2,0,c_white,image_alpha);
draw_text_color(x+_x,y-_y + i++*gap*2,string(source),_c,_c,_c,_c,image_alpha);

draw_set_alpha(1);

_x = (sprite_width - 25*2);
_y = -(sprite_height- 9*2);

for(var i = 0; i < initiative; i++)
{
	draw_sprite_ext(s_blueprint_initiative,0,x+_x,y-_y-i*6*2,2,2,0,c_white,image_alpha);
}