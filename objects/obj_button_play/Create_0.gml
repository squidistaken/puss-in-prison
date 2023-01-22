/// @description Inheritance

// Inherit the parent event
event_inherited();

// Activate button function
activate_button = function()
{
	global.playerControl = false;
	scr_playSeq(seq_backstory);
	instance_deactivate_all(false);
}
