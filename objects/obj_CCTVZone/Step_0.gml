///@description Timer

timer --;

if(timer == -300)
{
	image_index = image_index + 1;
	
	timer = 0
}

if (room == rm_puzzle04)
{
	if (place_meeting(x,y,obj_plr1) && image_index == 0)
	{
		global.whoGotCaught = "plr1";
		instance_deactivate_object(obj_cctvZone);
		scr_playSeq(seq_lose);
	}
	if (place_meeting(x,y,obj_plr2) && image_index == 0)
	{
		global.whoGotCaught = "plr2";
		instance_deactivate_object(obj_cctvZone);
		scr_playSeq(seq_lose);
	}
	if (place_meeting(x,y,obj_plr1) && place_meeting(x,y,obj_plr2) && image_index == 0)
	{
		global.whoGotCaught = "both";
		instance_deactivate_object(obj_cctvZone);
		scr_playSeq(seq_lose);
	}
}
else
{
	if ((place_meeting(x,y,obj_plr1)) || (place_meeting(x,y,obj_plr2))) && image_index == 0 
	{
		instance_deactivate_object(obj_cctvZone);
		scr_playSeq(seq_lose);
	}
}

