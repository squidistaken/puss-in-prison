/// @description Camera movement

//center position
centerviewX = camera_get_view_width(view_camera[0]) / 2;

if (obj_cameraPosition.x > obj_cameraLeftLimit.x) && (obj_cameraPosition.x < obj_cameraRightLimit.x)
{
	camera_set_view_pos(view_camera[0], x - centerviewX , -40);
}