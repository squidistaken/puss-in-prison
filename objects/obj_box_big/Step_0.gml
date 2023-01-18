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

// Pushing

// Checking for interaction with player objects
if (place_meeting(x-obj_plr1.horizontalSpeed,y,obj_plr1))
{
	pushState = true;
}

switch (pushState)
{
	case true:
		if (place_meeting(x-obj_plr1.horizontalSpeed,y,obj_plr1))
		{
			horizontalSpeed = obj_plr1.horizontalSpeed;
			obj_plr1.plrState = plr1State.pushing;
			// Alarm = Event you can call for X amount of steps
			alarm[0] = 1;
		}
		// Ensuring obj_plr1 and obj_plr2 do not overlap with the box.
		if (place_meeting(x-obj_plr1.horizontalSpeed,y,obj_plr1)) && (place_meeting(x-obj_plr2.horizontalSpeed,y,obj_plr2))
		{
			horizontalSpeed = 0;
			alarm[0] = 1;
		}
		break;
	case false:
		horizontalSpeed = 0;
		break;
}

if (horizontalSpeed != 0)
{
	audio_play_sound(sfx_box_push,1000,0);	
}

// Horizontal Collision
if (place_meeting(x+horizontalSpeed,y,obj_wall))
{
	while (!place_meeting(x+sign(horizontalSpeed),y,obj_wall))
	{

		x = x + sign(horizontalSpeed);	
	}
	horizontalSpeed = 0;
}

x = x + horizontalSpeed;

#endregion
