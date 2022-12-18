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

<<<<<<< Updated upstream
#region carrying mech

<<<<<<< HEAD
	itemNear = instance_nearest(x, y, obj_carryable); //check nearest carryable item

	function carryPlayer2()
	{
		obj_plr2.x = x
		obj_plr2.y = y - 64
=======
	itemNear = instance_nearest(x, y, obj_carryable); // check nearest carryable item
	
	function carryPlayer2()
	{
<<<<<<<< HEAD:objects/obj_Player1/Step_0.gml
<<<<<<< Updated upstream:objects/obj_Player1/Step_0.gml
		obj_Player2.x = x
		obj_Player2.y = y - 64
		obj_Player2.grv = 0;
========
		obj_plr2.x = x;
		obj_plr2.y = y - 64;
		obj_plr2.grv = 0;
>>>>>>>> 878818daf82a2e345f6d6ceea4ad0aa4d4298b79:objects/obj_plr1/Step_0.gml
=======
#region carrying mechanic

	itemNear = instance_nearest(x, y, obj_carryable); // check nearest carryable item

	function carryPlayer2()
	{
		obj_plr2.x = x
		obj_plr2.y = y - 64
		obj_plr2.grv = 0;
		global.carryingP2 = true;
		moveSpeed = 3;
>>>>>>> Stashed changes
	}

		
	if (itemCarrying != noone)
	{
<<<<<<< Updated upstream
		if (keyInteract)
=======
		obj_plr2.x = x;
		obj_plr2.y = y - 64;
>>>>>>> 878818daf82a2e345f6d6ceea4ad0aa4d4298b79
		obj_plr2.grv = 0;
		sprite_index = spr_plr1_carrying;
		moveSpeed = 3;
	}	
<<<<<<< HEAD

	if ((point_distance(x,y,itemNear.x,itemNear.y) <= 54) && (keyInteract)) //carry item
	{
		itemCarrying = itemNear;
		global.carryingP1 = !global.carryingP1;
	}
	
	if (global.carryingP1)
	{		
		if (itemCarrying != noone)
=======
		
	if (global.carryingP1)
	{		
		if (itemCarrying != noone)
>>>>>>> Stashed changes:objects/obj_plr1/Step_0.gml
>>>>>>> 878818daf82a2e345f6d6ceea4ad0aa4d4298b79
		{
			if (object_get_name(itemCarrying.object_index) == "obj_plr2")
			{	
				carryPlayer2();	
				if (keyInteract) //drop player 2
				{
					resetPlayer2Carry();
				}
			}
<<<<<<< HEAD

			else
			{
				scr_carryItem();

=======
			
			else
			{
<<<<<<<< HEAD:objects/obj_Player1/Step_0.gml
<<<<<<< Updated upstream:objects/obj_Player1/Step_0.gml
				obj_Player2.grv = 0.5;	
=======
				scr_carryItem();
			
>>>>>>> 878818daf82a2e345f6d6ceea4ad0aa4d4298b79
				if (keyInteract) //drop item
				{
					itemCarrying.grv = 0.5;
					global.carryingP1 = !global.carryingP1
					moveSpeed = 5;
				}
<<<<<<< HEAD
=======
>>>>>>> Stashed changes:objects/obj_plr1/Step_0.gml
========
				obj_plr2.grv = 0.5;	
>>>>>>>> 878818daf82a2e345f6d6ceea4ad0aa4d4298b79:objects/obj_plr1/Step_0.gml
>>>>>>> 878818daf82a2e345f6d6ceea4ad0aa4d4298b79
			}
		}
	}
	
<<<<<<< HEAD
=======
	if (point_distance(x, y,itemNear.x,itemNear.y) < 64) && (!global.carryingP1) && (keyInteract)
	{
<<<<<<< Updated upstream:objects/obj_Player1/Step_0.gml
		case true:	
			carryPlayer2();
			moveSpeed = 3;
			sprite_index = spr_plr1_carrying;
			
				
		case false: 
			moveSpeed = 5;
=======
		global.carryingP1 = !global.carryingP1;
		itemCarrying = itemNear;
>>>>>>> Stashed changes:objects/obj_plr1/Step_0.gml
	}

>>>>>>> 878818daf82a2e345f6d6ceea4ad0aa4d4298b79
#endregion
=======
		if (object_get_name(itemCarrying.object_index) == "obj_plr2")
		{			
			carryPlayer2();	
			show_debug_message(x);
			if (keyInteract) //drop player 2
			{
				resetPlayer2Carry();
				itemCarrying = noone; 
			}
		}
		
		else
		{
			scr_carryItem();
			if (keyInteract) //drop item
			{
				itemCarrying.grv = 0.5;
				itemCarrying = noone;
			}
		}
	}

	if (point_distance(x, y,itemNear.x,itemNear.y) < 64) && (itemCarrying == noone) && (keyInteract)
	{
		itemCarrying = itemNear;
	}

#endregion
>>>>>>> Stashed changes
