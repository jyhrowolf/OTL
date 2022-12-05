/// @description Draw stuff
draw_self();
if(highlighted > 0)
	draw_sprite_ext(s_top_labels_choice,(image_index) + (highlighted-1)*3,x,y,2,2,0,c_white,image_alpha);