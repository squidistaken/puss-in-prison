keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check_pressed(ord("W"));
keyInteract = keyboard_check_pressed(ord("E"));

#region horzizontal movement/collision

	horizontalSpeed = (keyRight - keyLeft) * moveSpeed;

	//horizontal collision
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

#region vertical movement/collsion

	//vertical movement

	verticalSpeed = verticalSpeed + grv;

	//jump
	function jump()
	{
	 verticalSpeed = -10;	
	}

	if (place_meeting(x,y+verticalSpeed,obj_wall)) && (keyUp)
	{
		audio_play_sound(sfx_plr2_jump_1,1000,0);
		jump();
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

#region being carried
	
	//jump from carry
	if (global.carryingP2) && (keyUp)
	{
		resetPlayer2Carry();
		audio_play_sound(sfx_plr2_jump_2,1000,0);
		jump();
		obj_plr1.itemCarrying = noone; 
	}
	
#endregion

#region carry mechanic

	itemNear = instance_nearest(x, y, obj_par_item);
	
	if (itemCarrying != noone) 
	{
		scr_carryItem();
		if (keyInteract) //drop item
		{
			itemCarrying.grv = 0.5;
			itemCarrying = noone;
		}
	}

	if (point_distance(x, y,itemNear.x,itemNear.y) < 64) && (itemCarrying == noone) && (keyInteract) && (itemNear != obj_plr1.itemCarrying)
	{
		itemCarrying = itemNear;
	}

#endregion




