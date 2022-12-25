/// @description Draw Button
draw_sprite_ext(s_bottom_end_back,0,x,y,3,3,0,c_white,1);
if(golden && image_index == 2)
	draw_sprite_ext(s_bottom_gold_pass,0,x,y,3,3,0,c_white,image_alpha);
else
	draw_self();