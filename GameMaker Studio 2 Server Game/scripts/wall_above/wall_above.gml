///@func wall_above()
function wall_above() {

	return collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top - 1, objWall, false, true)


}
