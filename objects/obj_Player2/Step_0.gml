keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));

horizontalSpeed = keyRight - keyLeft;

x = x + horizontalSpeed * moveSpeed;

//vertical movement

verticalSpeed = verticalSpeed + grv;

if (place_meeting(x,y+verticalSpeed,obj_Wall)) && (keyUp)
{
	verticalSpeed = -10;
}

if (place_meeting(x,y+verticalSpeed,obj_Wall))
{
	while (!place_meeting(x,y+sign(verticalSpeed),obj_Wall))
	{
	 y = y + sign(verticalSpeed);	
	}
	verticalSpeed = 0;
}

y = y + verticalSpeed;