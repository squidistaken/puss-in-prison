//check if player whithin distance

<<<<<<< Updated upstream
distancePlayer1X = x - obj_Player1.x;
distancePlayer1Y = y - obj_Player1.y;
distancePlayer2X = x - obj_Player2.x;
distancePlayer2Y = y - obj_Player2.y;

if (distancePlayer1X < 20) && (distancePlayer1Y < 20) && (obj_Player1.keyInteract)
=======
// Checking if player is within distance
if (point_distance(x,y,obj_plr1.x,obj_plr1.y) <= 64) && (obj_plr1.keyInteract)
>>>>>>> Stashed changes
{
	show_debug_message("clickP1")	
}

<<<<<<< Updated upstream
if (distancePlayer2X < 20) && (distancePlayer2Y < 20) && (obj_Player2.keyInteract)
=======
if (point_distance(x,y,obj_plr2.x,obj_plr2.y) <= 64) && (obj_plr2.keyInteract)
>>>>>>> Stashed changes
{
	show_debug_message("clickP2")	
}
