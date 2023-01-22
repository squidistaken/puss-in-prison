
/// @description Inheritance

// Inherit the parent event
event_inherited();

// Activate button function
activate_button = function()
{
	switch room
	{
		case rm_ending01:
			room_goto(rm_ending01_2);
			break
		case rm_ending02:
			room_goto(rm_ending02_2);
			break
	}
}