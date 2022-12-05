//check if player whithin distance

distancePlayer1X = x - obj_Player1.x;
distancePlayer1Y = y - obj_Player1.y;
distancePlayer2X = x - obj_Player2.x;
distancePlayer2Y = y - obj_Player2.y;

if (distancePlayer1X < 20) && (distancePlayer1Y < 20) && (obj_Player1.keyInteract)
{
	show_debug_message("clickP1");	
}

if (distancePlayer2X < 20) && (distancePlayer2Y < 20) && (obj_Player2.keyInteract)
{
	show_debug_message("clickP2");
}

