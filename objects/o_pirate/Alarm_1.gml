/// @description Insert description here
event_inherited();

if(random(1) >= .5)
{
	path_speed = -path_speed;
	correction = -10;
}
else
{
	correction = 10;
}

alarm[0] = 0;
