function scr_playSeq(_sequence)
{
	global.playerControl = false;
	var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
	var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);
	// Create (play) sequence
	layer_sequence_create("Cutscenes",_camX,_camY,_sequence);
	// Make sure custcenes layer is above action
	layer_depth("Cutscenes",-10000);
}

function scr_loseRestart()
{
	room_restart();
	global.playerControl = true;
} 

function scr_startGame()
{
	// change this for final
	room_goto(rm_puzzle00);
	global.playerControl = true;	
}