/// @description Unlocking doors

// Checking to see if either player is colliding with the door
if (place_meeting(x-obj_plr2.horizontalSpeed,y,obj_plr2)) || (place_meeting(x-obj_plr1.horizontalSpeed,y,obj_plr1))
{
	// Checking to see if someone is carrying something
	if (obj_plr1.itemCarrying != noone)
	{
		// Checking for item type, if we want we can do a switch-case loop, but it's not needed for one key/door system
		if obj_plr1.itemCarrying.itemType == "key"
		{
			// There is a quirk that has doors require to reach a switch count, to solve this we can just make x = x pretty much.
			global.switchCount = obj_switch.switchesNeeded;
			instance_deactivate_object(obj_plr1.itemCarrying);
			// Make sure the player isn't carrying something...
			scr_dropItem(obj_plr1);
			audio_play_sound(sfx_switch_on,10000,0);
		}
	}
	if (obj_plr2.itemCarrying != noone)
	{
		if obj_plr2.itemCarrying.itemType == "key"
		{
			global.switchCount = obj_switch.switchesNeeded;
			instance_deactivate_object(obj_plr2.itemCarrying);
			scr_dropItem(obj_plr2);
			audio_play_sound(sfx_switch_on,10000,0);
		}
	}
}
