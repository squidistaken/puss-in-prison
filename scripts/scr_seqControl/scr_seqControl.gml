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
	if (room == rm_puzzle04)
	{
		switch global.whoGotCaught
		{
			case "plr1":
				room_goto(rm_ending01);
				break
			case "plr2":
				room_goto(rm_ending02);
				break
			case "both":
				room_goto(rm_ending03);
				break
		}
	}
	else
	{
		if global.loseCount <= 3
		{
			room_restart();
			global.loseCount = global.loseCount + 1; 
			global.playerControl = true;
		}
		if global.loseCount >= 3
		{
			room_goto(rm_ending03);
		}
	}
} 

function scr_startGame()
{
	room_goto(rm_puzzle00);
	global.loseCount = 0;
	global.playerControl = true;	
}