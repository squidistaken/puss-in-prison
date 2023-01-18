/// @description Respawning and lose

if (place_meeting(x,y,obj_plr1))
{
	obj_plr1.x = 256;
	obj_plr1.y = 640;
}

if (place_meeting(x,y,obj_plr2))
{
	obj_plr2.x = 256;
	obj_plr2.y = 640;
}

if (place_meeting(x,y,obj_box_normal))
{
	instance_deactivate_object(obj_pos_reset);
	scr_playSeq(seq_lose);
}