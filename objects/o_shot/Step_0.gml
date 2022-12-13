/// @description Move towards target

if(target != noone)
{
	speed = 0;
	if(instance_exists(target))
	{
		direction = point_direction(x,y,target.x,target.y);
		x = lerp(x,target.x,(30-alarm[0])/120);
		y = lerp(y,target.y,(30-alarm[0])/120);
	
		if((abs(x-target.x) < 1 && abs(y-target.y) < 1))
		{
			alarm[0] = 1;
		}
	}
	else
	{
		target = noone;
		speed = 2;
	}
}