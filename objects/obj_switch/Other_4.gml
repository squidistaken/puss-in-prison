/// @description Room Setup

global.switchCount = 0; // Always set to zero when a new room loads

// Convenient futureproofing!
switch room
{
	case rm_puzzle00:
		// Defining how many switches need to be flicked to deactivate the object.
		switchesNeeded = 1;
		break
	case rm_puzzle01:
		switchesNeeded = 2;
		break
	case rm_graybox:
		switchesNeeded = 2;
		break
}