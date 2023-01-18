///@description Timer

timer --;

if(timer == -60)
{
	image_index = image_index + 1;
	
	timer = 0
}

// Maybe we could change this check to be based on the item state vs image index state, in case we add more frames
if ((place_meeting(x,y,obj_plr1)) || (place_meeting(x,y,obj_plr2))) && image_index == 0 
{
	instance_deactivate_object(obj_cctvZone);
	scr_playSeq(seq_lose);
}
