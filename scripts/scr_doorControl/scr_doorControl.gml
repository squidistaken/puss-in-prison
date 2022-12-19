// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function switchControl(){
	// Checking the state of the switch, at default when created it is false
	switch switchIsOn 
	{
		case false:
			// Checking to see if an instance of the object exists
			// TODO: Account for different door objects
			if instance_exists(obj_doorBarrier)
			{
				// TODO: We can use enums to determine multiple states for doors that might already be open/closed.
				instance_deactivate_object(obj_doorBarrier);
			}
			switchIsOn = true;
			break;
		case true:
			instance_activate_object(obj_doorBarrier);
			if instance_exists(obj_doorBarrier)
			{
				instance_activate_object(obj_doorBarrier);
			}
			switchIsOn = false;
			break
	}
}