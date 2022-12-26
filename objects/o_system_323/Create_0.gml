/// @description settup planets and home system
// no planet, no pirates

var controller = instance_find(o_game_controller,0);
var token = array_pop(controller.exploration_tokens);
exploration_token = instance_create_layer(x,y,"Controllers",asset_get_index(token));