function scr_carryItem(){
	itemCarrying.x = x;
	itemCarrying.y = y - 64;
	itemCarrying.grv = 0;
}

function carryPlayer2()
{
	obj_plr2.x = x;
	obj_plr2.y = y - 110;
	obj_plr2.grv = 0;
	moveSpeed = 3;
}
	
function resetPlayer2Carry(){ //reset plr 2 to original state
	obj_plr2.grv = 0.5; 
	global.carryingP2 = false;
	obj_plr1.moveSpeed = 5;
}
