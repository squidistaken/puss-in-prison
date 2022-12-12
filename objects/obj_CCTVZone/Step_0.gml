

timer --;

if(timer == -60)
{
	image_index = image_index + 1;
	
	timer = 0
}

if ((place_meeting(x,y,obj_Player1)) || (place_meeting(x,y,obj_Player2))) && image_index == 0
{
	game_restart();
}

