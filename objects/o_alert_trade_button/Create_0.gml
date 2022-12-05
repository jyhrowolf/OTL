/// @description Set Depth
update_depth = function(_high)
{
	highlighted = _high;
	if(highlighted == 1)
		depth = -18;
	else if(highlighted == 2)
		depth = -17;
	else
		depth = -16;
}