#region Player interaction

if (place_meeting(x,y,obj_plr1) && obj_plr1.keyInteract) || (place_meeting(x,y,obj_plr2) && obj_plr2.keyInteract)
{
	switch isSwitched
	{
		case true:
			audio_play_sound(sfx_switch_off,1000,0);
			isSwitched = false;
			// Contributing to total
			image_index = 0;
			
			obj_bridge_controller.segment2active = !obj_bridge_controller.segment2active;
			obj_bridge_controller.segment3active = !obj_bridge_controller.segment3active;
			
			break
		case false:
			audio_play_sound(sfx_switch_on,1000,0);
			isSwitched = true;
			// Contributing to total
			image_index = 1;
			
			obj_bridge_controller.segment2active = !obj_bridge_controller.segment2active;
			obj_bridge_controller.segment3active = !obj_bridge_controller.segment3active;
			
			break
	}
}
#endregion
