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
		audio_play_sound(sfx_plr1_jump,1000,0);
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
		obj_plr2.x = x;
		obj_plr2.y = y - 110;
		obj_plr2.grv = 0;
		moveSpeed = 3;
		sprite_index = spr_plr1_carrying;
	}
	

	
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
		if (keyInteract) //drop item
		{
			itemCarrying.grv = 0.5;
			itemCarrying = noone;
			pauseFrame = true;
		}
	}


	//pickup item
	if (!pauseFrame) && (place_meeting(x,y,itemNear)) && (itemCarrying == noone) && (keyInteract) && (itemNear != obj_plr2.itemCarrying)
	{
		itemCarrying = itemNear;
	}

#endregion

pauseFrame = false;
