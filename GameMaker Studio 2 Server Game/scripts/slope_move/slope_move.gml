///@func slope_move( xdir )
///@arg xdir
function slope_move() {

	var xdir = argument[0]

	// Inside a slope (must go up)
	if collision_point(x, y - 1, objSlope, true, true)
	{
	    // If we cannot move up, we must go back.
	    if !move_y(-1)
	    {
	        x -= xdir
	        return false
	    }
	}

	// On a slope going down
	if !on_ground() && collision_point(x, y + 1, objSlope, true, true)
	{
	    move_y(1) // Hey there! Hello move_y, my friend!
	}

	return true


}
