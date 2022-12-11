// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_remove(_list,_obj)
{
	for(var i = 0; i < array_length(_list); i++)
	{
		if(_obj.id == _list[i].id)
		{
			array_delete(_list,i,1);
			return true;
		}
	}
	return false;
}