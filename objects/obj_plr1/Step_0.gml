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

#region carrying mechanic

	itemNear = instance_nearest(x, y, obj_par_item); // check nearest carryable item

	function carryPlayer2()
	{
		obj_plr2.x = x
		obj_plr2.y = y - 64
		obj_plr2.grv = 0;
		global.carryingP2 = true;
		moveSpeed = 3;
	}
	
	if (keyInteract) && (global.carryingP2)
	{
		resetPlayer2Carry();
		global.carryingP2 = false;
	}
	
	if ( (point_distance(x,y,obj_plr2.x,obj_plr2.y) <= 54) && (point_distance(x, y,itemNear.x,itemNear.y) >= 64) && (keyInteract) && (itemCarrying == noone) ) || (global.carryingP2) 
	{
		global.carryingP2 = true;
		carryPlayer2();
	}


	
	
	if (itemCarrying != noone) && (!global.carryingP2)
	{
		scr_carryItem();
		if (keyInteract) //drop item
		{
			itemCarrying.grv = 0.5;
			itemCarrying = noone;
		}
	}

	if (point_distance(x, y,itemNear.x,itemNear.y) < 64) && (itemCarrying == noone) && (keyInteract) && (itemNear != obj_plr2.itemCarrying)
	{
		itemCarrying = itemNear;
	}

#endregion
