/// @description 1-4 vp
event_inherited();

combat_reward = function()
{
	var odds = [1,1,1,1,2,2,2,3,3,4];
	victory_points = odds[irandom_range(0,9)];
}