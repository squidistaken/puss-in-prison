switch global.playerControl
{
	case true:
		keyLeft = keyboard_check(ord("A"));
		keyRight = keyboard_check(ord("D"));
		keyUp = keyboard_check_pressed(ord("W"));
		keyInteract = keyboard_check_pressed(ord("E"));
		break
	case false:
		keyLeft = 0;
		keyRight = 0;
		keyUp = 0;
		keyInteract = 0;
		plrState = plr2State.spin;
		break
}


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
	 plrState = plr2State.jumping;
	 verticalSpeed = -14;	
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
		itemCarrying.y = y - 100;
		if (keyInteract) //drop item
		{
			scr_dropItem(obj_plr2);
		}
	}

	if (place_meeting(x,y,itemNear)) && (itemCarrying == noone) && (keyInteract) && (itemNear != obj_plr1.itemCarrying) && (!pauseFrame)
	{
		audio_play_sound(sfx_key_interact,10000,0);
		itemCarrying = itemNear;
	}

	pauseFrame = false;

#endregion

#region Animation States
	
	switch keyboard_key {
		case ord("D"):
			if (horizontalSpeed != 0)
			{
				plrState = plr2State.walking;
			}
			dir = 1;
			break
		case ord("A"):
			if (horizontalSpeed != 0)
			{
				plrState = plr2State.walking;
			}
			dir = 2;
			break
		case ord("E"):
			plrState = plr2State.action;
			break
	}

	// Setting sprites based on states and directions
	switch plrState
	{
		case plr2State.idle:
			image_speed = 1;
			break
		case plr2State.walking:
			if (horizontalSpeed = 0)
			{
				plrState = plr2State.idle;
			}
			if (verticalSpeed != 0)
			{
				plrState = plr2State.jumping;
			}
			break
		case plr2State.jumping:
			if (image_index >= image_number-1)
			{
				image_speed = 0;
			}
			if (place_meeting(x,y+verticalSpeed,obj_wall))
			{
				image_speed = 1;
				plrState = plr1State.idle;
			}
			break
		case plr2State.action:
			if (image_index >= image_number-1)
			{
				plrState = plr2State.idle;
			}
			break
		case plr2State.spin:
			dir = 0;
			break
	}
	
	// Sprite Index via Arrays
	sprite_index = plrSpr[plrState][dir];

#endregion


