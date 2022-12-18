/// @description Interaction with player

// Determining what frame the object should be, might look into arrays for improving?
switch switchIsOn
{
	case true:
		image_index = 0;
		break;
	case false:
		image_index = 1;
		break;
}

// We could probably move the above script into a function since they will be identical regardless of player interaction!

// Checking for interaction with player 1 AND if they use the interact key
if (place_meeting(x,y,obj_plr1)) && obj_plr1.keyInteract
{
	// Checking the state of the switch, at default when created it is false
	switch switchIsOn 
	{
		case false:
			// Checking to see if an instance of the object exists
			if instance_exists(obj_doorBarrier)
			{
				// TODO: We can use enums to determine multiple states for doors that might already be open/closed.
				instance_deactivate_object(obj_doorBarrier);
			}
			switchIsOn = true;
			break;
		case true:
			instance_activate_object(obj_doorBarrier);
			if instance_exists(obj_doorBarrier)
			{
				instance_activate_object(obj_doorBarrier);
			}
			switchIsOn = false;
			break
	}
}

if (place_meeting(x,y,obj_plr2)) && obj_plr2.keyInteract
{
	switch switchIsOn 
	{
		case false:
			if instance_exists(obj_doorBarrier)
			{
				instance_deactivate_object(obj_doorBarrier);
			}
			switchIsOn = true;
			break;
		case true:
			instance_activate_object(obj_doorBarrier);
			if instance_exists(obj_doorBarrier)
			{
				instance_activate_object(obj_doorBarrier);
			}
			switchIsOn = false;
			break
	}
}






