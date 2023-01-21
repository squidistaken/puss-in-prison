if (keyboard_check(vk_escape)){
	image_speed = 28;
	if(image_index >= 55){
	room_goto(rm_title);	
	}
}
else{
	image_speed = 0;
	image_index = 0;
}

