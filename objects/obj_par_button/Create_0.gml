/// @description Setup

// Interact function
interact = function() 
{
	if (active) // checking if button is active
	{
		activate_button();
	}
}

// Activate button function
activate_button = function()
{
	show_debug_message("Default button message");
}