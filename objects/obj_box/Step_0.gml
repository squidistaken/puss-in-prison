/// @description Movement & Interaction

#region Vertical

// Vertical Movement
verticalSpeed = verticalSpeed + grv;
	
// Vertical Collision
if (place_meeting(x,y+verticalSpeed,obj_wall))
{
	while (!place_meeting(x,y+sign(verticalSpeed),obj_wall))
	{
		y = y + sign(verticalSpeed);	
	}
	verticalSpeed = 0;
}

y = y + verticalSpeed;

#endregion

#region Horizontal 
// Horizontal Collision

if (place_meeting(x+horizontalSpeed,y,obj_wall))
{
	while (!place_meeting(x+sign(horizontalSpeed),y,obj_wall))
	{

		x = x + sign(horizontalSpeed);	
	}
	horizontalSpeed = 0;
}

// TODO - Figure out a nonjank method of pushing the object

x = x + horizontalSpeed;

#endregion






