keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check_pressed(ord("W"));
keyInteract = keyboard_check_pressed(ord("E"));

#region horzizontal movement/collision

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

#endregion

#region vertical movement/collsion

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

#endregion

#region being carried and jumping
	
	if(obj_plr1.itemCarrying != noone)
	{
		if(object_get_name(obj_plr1.itemCarrying.object_index) == "obj_plr2") && (keyUp)
		{
			resetPlayer2Carry();
			jump();
		}
	}
	
<<<<<<< Updated upstream:objects/obj_Player2/Step_0.gml
#endregion
=======
#endregion

#region carrying mech

	itemNear = instance_nearest(x, y, obj_carryable); // check nearest carryable item
		
	if (global.carryingP2)
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
					global.carryingP2 = !global.carryingP2;
					moveSpeed = 5;
				}
			}
		}
	}
	
	if (point_distance(x, y,itemNear.x,itemNear.y) < 64) && (!global.carryingP2) && (keyInteract)
	{
		global.carryingP2 = !global.carryingP2;
		itemCarrying = itemNear;
	}

#endregion
show_debug_message(object_get_name(itemNear.object_index))
>>>>>>> Stashed changes:objects/obj_plr2/Step_0.gml
