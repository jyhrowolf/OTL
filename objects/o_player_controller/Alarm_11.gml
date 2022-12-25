/// @description Current player pass
show_debug_message(string(active_player) + " PASSED");
players[active_player].passed = true;
if(next_round_active_player == 0)
{
	next_round_active_player = active_player;
	players[active_player].civilization.resources[0] += 2;
	bottom_bar.my_buttons[6].golden = false;
}
alarm[0] = 1;