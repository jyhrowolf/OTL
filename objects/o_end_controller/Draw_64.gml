/// @description Insert description here
// You can write your code in this editor



for(var i = 0; i < array_length(players);i++)
{
	draw_text(window_get_width()/2,window_get_height()/3+10*i*3,
			"Player " +string(players[i][0]) + " with " + string(players[i][1]) + " victory points");
}