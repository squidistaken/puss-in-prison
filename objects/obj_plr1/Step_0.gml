///@description Movement

switch global.playerControl
{
	case true:
		keyLeft = keyboard_check(vk_left);
		keyRight = keyboard_check(vk_right);
		keyUp = keyboard_check_pressed(vk_up);
		keyInteract = keyboard_check_pressed(vk_shift);
		break
	case false:
		keyLeft = 0;
		keyRight = 0;
		keyUp = 0;
		keyInteract = 0;
		plrState = plr1State.spin;
		break
}

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
		audio_play_sound(sfx_plr1_jump,1000,0);
		plrState = plr1State.jumping;
		verticalSpeed = -14;
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
	
	if (global.carryingP2)
	{
		carryPlayer2();
		if (keyInteract) 
		{
			audio_play_sound(sfx_plr1_land,100,0);
			resetPlayer2Carry();
			pauseFrame = true;
		}
	}
	
	if (!place_meeting(x,y - 70, obj_wall)) && (place_meeting(x,y,obj_plr2)) && (keyInteract) && (itemCarrying == noone) && (!pauseFrame) && ((!place_meeting(x,y,itemNear)) || (itemNear == obj_plr2.itemCarrying))
	{
		global.carryingP2 = true;
		audio_play_sound(sfx_plr1_carry_plr2,100,0);
	}


	if (itemCarrying != noone) && (!global.carryingP2)
	{
		scr_carryItem();
		itemCarrying.y = y - 150;
		if (keyInteract) //drop item
		{
			scr_dropItem(obj_plr1);
		}
	}

	switch global.carryingP2
	{
		case true:
			mask_index = spr_carry_mask;
			break
		case false:
			mask_index = spr_plr1_idle_front;
			break
	}


	//pickup item
	if (!pauseFrame) && (place_meeting(x,y,itemNear)) && (itemCarrying == noone) && (keyInteract) && (itemNear != obj_plr2.itemCarrying)
	{
		itemCarrying = itemNear;
	}

	pauseFrame = false;
	
#endregion

#region Animation States
	
	switch keyboard_key {
		case vk_right:
			if (horizontalSpeed != 0)
			{
				plrState = plr1State.walking;
			}
			dir = 1;
			break
		case vk_left:
			if (horizontalSpeed != 0)
			{
				plrState = plr1State.walking;
			}
			dir = 2;
			break
		case vk_shift:
			plrState = plr1State.action;
			break
	}

	// Setting sprites based on states and directions
	switch plrState
	{
		case plr1State.idle:
			image_speed = 1;
			break
		case plr1State.walking:
			if (horizontalSpeed = 0)
			{
				plrState = plr1State.idle;
			}
			if (verticalSpeed != 0)
			{
				plrState = plr1State.jumping;
			}
			break
		case plr1State.jumping:
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
		case plr1State.action:
			if (image_index >= image_number-1)
			{
				plrState = plr1State.idle;
			}
			break
		case plr1State.spin:
			dir = 0;
			break
	}
	
	// Sprite Index via Arrays
	sprite_index = plrSpr[plrState][dir];

#endregion