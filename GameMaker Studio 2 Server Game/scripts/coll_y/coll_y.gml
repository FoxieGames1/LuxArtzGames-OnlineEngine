///@func coll_y(ydir, [obj])
function coll_y() {

	var ydir = argument[0]
	var obj = argument_count == 2 ? argument[1] : objWall

	var side_to_check = ydir ? bbox_bottom + 1 : bbox_top - 1

	return collision_rectangle(bbox_left, side_to_check, bbox_right, side_to_check, obj, false, true)



}
