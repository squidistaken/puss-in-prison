if (keyboard_check(ord("R"))){
	image_speed = 28;
	if(image_index >= 55){
	room_restart();	
	}
}
else{
	image_speed = 0;
	image_index = 0;
}

