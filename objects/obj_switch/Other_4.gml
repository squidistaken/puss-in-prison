/// @description Room Setup

global.switchCount = 0; // Always set to zero when a new room loads

// Convenient futureproofing!
switch room
{
	case rm_puzzle00:
		// Defining how many switches need to be flicked to deactivate the object.
		sprite_index = spr_switch_floor;
		switchesNeeded = 1;
		break
	case rm_puzzle01:
		sprite_index = spr_switch_wall;
		switchesNeeded = 2;
		break
	case rm_puzzle02:
		sprite_index = spr_switch_floor;
		switchesNeeded = 1;
		break
	case rm_puzzle04:
		switchesNeeded = 1;
		break
	case rm_graybox:
		switchesNeeded = 2;
		break
}