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

// Checking for interaction with either player AND if they use the interact key
if (place_meeting(x,y,obj_plr1) && obj_plr1.keyInteract) || (place_meeting(x,y,obj_plr2) && obj_plr2.keyInteract)
{
	scr_switchControl();	
}






