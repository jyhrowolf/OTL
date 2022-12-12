/// @description settup stuff
var pc = instance_find(o_player_controller,0);
player = pc.active_player;
round_count = pc.round_count;
civilization = pc.players[player].civilization;
research = civilization.research;

civilization.connect_info(self);

recalculate_civilization = function()
{
	victory_points = civilization.calculate_victory_points();
}

recalculate_civilization();