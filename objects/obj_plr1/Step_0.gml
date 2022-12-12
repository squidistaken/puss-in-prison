///@description Movement

keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check_pressed(vk_up);
keyInteract = keyboard_check_pressed(vk_shift);

#region horizontal collision/movement

	horizontalSpeed = (keyRight - keyLeft) * moveSpeed;
	
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

#region vertical movement/collision

	//vertical movement
	verticalSpeed = verticalSpeed + grv;
	
	//jump
	if (place_meeting(x,y+verticalSpeed,obj_wall)) && (keyUp)
	{
		verticalSpeed = -10;
	}


	//vertical collsion
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

#region carry
	//carry player 2
	function carryPlayer2()
	{
		obj_plr2.x = x
		obj_plr2.y = y - 64
		obj_plr2.grv = 0;
	}

	if (point_distance(x,y,obj_plr2.x,obj_plr2.y) < 54) || (global.carrying)
	{
		if (keyInteract)
		{
			global.carrying = !global.carrying;	
			if(!global.carrying)
			{
				obj_plr2.grv = 0.5;	
			}
		}
	}

	switch (global.carrying)
	{
		case true:	
			carryPlayer2();
			moveSpeed = 3;
			sprite_index = spr_plr1_carrying;
			
				
		case false: 
			moveSpeed = 5;
	}

#endregion