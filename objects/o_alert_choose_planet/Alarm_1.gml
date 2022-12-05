/// @description Delete button
var gc = instance_find(o_game_controller,0);
gc.busy = 0;
gc.player_controller.alarm[7] = 1;
instance_destroy(self);