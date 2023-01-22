/// @description Progress to next room

if room != rm_puzzle04
{
	if (place_meeting(x,y,obj_plr1) && place_meeting(x,y,obj_plr2))
	{
		audio_play_sound(sfx_ui_transition,10000,0);
		room_goto_next();
	}
}

if room == rm_puzzle04
{
	if (place_meeting(x,y,obj_plr2))
	{
		timer = timer - 1;
		
		if (timer <= 0)
		{
			audio_play_sound(sfx_gameover_3,10000,0);
			room_goto(rm_ending01);
		}
		
		if (place_meeting(x,y,obj_plr1))
		{
			audio_play_sound(sfx_ui_finish,10000,0);
			room_goto(rm_ending00);
		}
	}
}
