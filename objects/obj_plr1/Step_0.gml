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

#region carrying mech

	itemNear = instance_nearest(x, y, obj_carryable); //check nearest carryable item

	function carryPlayer2()
	{
		obj_plr2.x = x
		obj_plr2.y = y - 64
		obj_plr2.grv = 0;
		sprite_index = spr_plr1_carrying;
		moveSpeed = 3;
	}	

	if ((point_distance(x,y,itemNear.x,itemNear.y) <= 54) && (keyInteract)) //carry item
	{
		itemCarrying = itemNear;
		global.carryingP1 = !global.carryingP1;
	}
	
	if (global.carryingP1)
	{		
		if (itemCarrying != noone)
		{
			if (object_get_name(itemCarrying.object_index) == "obj_plr2")
			{	
				carryPlayer2();	
				if (keyInteract) //drop player 2
				{
					resetPlayer2Carry();
				}
			}

			else
			{
				scr_carryItem();

				if (keyInteract) //drop item
				{
					itemCarrying.grv = 0.5;
					global.carryingP1 = !global.carryingP1
					moveSpeed = 5;
				}
			}
		}
	}
	
#endregion
