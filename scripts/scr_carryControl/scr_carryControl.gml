// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_carryItem(){
	itemCarrying.x = x;
	itemCarrying.y = y - 64;
	itemCarrying.grv = 0;
}

function resetPlayer2Carry(){ //reset plr 2 to original state
	obj_plr2.grv = 0.5; 
	itemCarrying = noone; 
	global.carryingP1 = !global.carryingP1;
	obj_plr1.sprite_index = spr_plr1;
	obj_plr1.moveSpeed = 5;
}

