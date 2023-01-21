/// @description Game Setup
global.playerControl = true;

// There was a bug for sequences where audio was one direction only, this fixes it!
audio_listener_position(window_get_width()/2, window_get_height()/2, 0);
audio_listener_orientation(0, 0, 1000, 0, -1 ,0);

#region Player States

enum plr1State
{
	idle,
	walking,
	jumping,
	pushing,
	action,
	spin,
	carrying,
}

enum plr2State
{
	idle,
	walking,
	jumping,
	pushing,
	action,
	spin,
	carrying,
}

#endregion









