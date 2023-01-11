/// @description Interactions with player

#region Door handling
if (switchCount == switchesNeeded)
{
	instance_deactivate_object(obj_door);
}
else
{
	instance_activate_object(obj_door);
}

#endregion

#region Player interaction

if (place_meeting(x,y,obj_plr1) && obj_plr1.keyInteract) || (place_meeting(x,y,obj_plr2) && obj_plr2.keyInteract)
{
	switch isSwitched
	{
		case true:
			audio_play_sound(sfx_switch_off,1000,0);
			isSwitched = false;
			// Contributing to total
			switchCount -= 1;
			image_index = 0;
			break
		case false:
			audio_play_sound(sfx_switch_on,1000,0);
			isSwitched = true;
			// Contributing to total
			switchCount += 1;
			image_index = 1;
			break
	}
}
#endregion
