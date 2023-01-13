/// @description Setup

// Interact function
interact = function() 
{
	if (active) // checking if button is active
	{
		audio_play_sound(sfx_ui_select,1000,0);
		activate_button();
	}
}

// Activate button function - copy and paste :)
activate_button = function()
{
	show_debug_message("Default button message");
}