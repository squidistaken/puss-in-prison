/// @description move camera

//center position
centerviewX = camera_get_view_width(view_camera[0]) / 2;

if (obj_cameraPostion.x > obj_cameraLeftLimit.x) && (obj_cameraPostion.x < obj_cameraRightLimit.x)
{
	camera_set_view_pos(view_camera[0], x - centerviewX , -40);
}