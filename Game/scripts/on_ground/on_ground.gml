///@func on_ground()
///@desc return true if colliding with any of the following blocks, false otherwise
function on_ground() {

	return on_wall() || on_slope() || on_jumpthrough()


}
