/// @description Draw Button
var c = 0;
for(var i = max_colony; i > 0; i--)
{
	draw_sprite_ext(s_top_colony,(c < colony),x-((max_colony-i+1)*25)*3 + 4,y,3,3,0,c_white,1);
	c++;
}
draw_sprite_ext(s_top_colony_button,1,x,y,3,3,0,c_white,1);
draw_self();