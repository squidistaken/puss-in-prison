///@description Interactions

// Checking if player is within distance

distancePlayer1X = x - obj_plr1.x;
distancePlayer1Y = y - obj_plr1.y;
distancePlayer2X = x - obj_plr2.x;
distancePlayer2Y = y - obj_plr2.y;

if (distancePlayer1X < 20) && (distancePlayer1Y < 20) && (obj_plr1.keyInteract)
{
	show_debug_message("clickP1");	
}

if (distancePlayer2X < 20) && (distancePlayer2Y < 20) && (obj_plr2.keyInteract)
{
	show_debug_message("clickP2");
}

