keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check_pressed(ord("W"));
keyInteract = keyboard_check_pressed(ord("E"));

horizontalSpeed = (keyRight - keyLeft) * moveSpeed;

//horizontal collision
if (place_meeting(x+horizontalSpeed,y,obj_Wall))
{
	while (!place_meeting(x+sign(horizontalSpeed),y,obj_Wall))
	{
	 x = x + sign(horizontalSpeed);	
	}
	horizontalSpeed = 0;
}

x = x + horizontalSpeed;

//vertical movement

verticalSpeed = verticalSpeed + grv;

//jump
function jump()
{
 verticalSpeed = -10;	
}

if (place_meeting(x,y+verticalSpeed,obj_Wall)) && (keyUp)
{
	jump();
}

//vertical collsion
if (place_meeting(x,y+verticalSpeed,obj_Wall))
{
	while (!place_meeting(x,y+sign(verticalSpeed),obj_Wall))
	{
	 y = y + sign(verticalSpeed);	
	}
	verticalSpeed = 0;
}

y = y + verticalSpeed;

//cancel carry
if(global.carrying) && (keyUp)
{
	global.carrying = !global.carrying;	
	grv = 0.5;
	jump();
}

