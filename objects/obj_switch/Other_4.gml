/// @description Room Setup

switchCount = 0; // Always set to zero when a new room loads

// Convenient futureproofing!
switch room
{
	// Checking for a specific room
	case rm_graybox:
		// Defining how many switches need to be flicked to deactivate the object.
		switchesNeeded = 1;
		break
	case rm_puzzle00:
		switchesNeeded = 1;
		break
}