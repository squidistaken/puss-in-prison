/// @description Progress to next room

if (place_meeting(x,y,obj_plr1) && place_meeting(x,y,obj_plr2))
{
	audio_play_sound(sfx_ui_transition,10000,0);
	room_goto_next();
}