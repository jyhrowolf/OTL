/// @description Insert description here
// You can write your code in this editor
if(weapons)
{
	draw_sprite_ext(s_weapon_shot,damage-1 + class*4,x,y,1,1,direction,c_white,image_alpha);
}
else
{
	draw_sprite_ext(s_missile_shot,damage-1 + class*4,x,y,1,1,direction,c_white,image_alpha);
}