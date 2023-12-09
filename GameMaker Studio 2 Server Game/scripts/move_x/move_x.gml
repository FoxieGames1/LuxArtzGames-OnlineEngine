///@func move_x(xvel, [do_slope, instance])
///@arg xvel
///@arg [do_slope]
///@arg [instance]
function move_x() {

	// Apply default arguments
	var xvel    = argument[0]  // Notice how xvel becomes a local variable
	var xdir    = sign(xvel)  // Also xdir becomes a local
	var instance = self
	var do_slope = false

	// Override variable number default arguments
	switch (argument_count)
	{
	  case 3: instance = argument[2];
	  case 2: do_slope = argument[1];
	}

	// Movement/Collision X
	repeat(abs(xvel))
	{
		with(instance)
		{
			// If we collided with something, return false
		    if place_meeting(x + xdir, y, objWall)
				return false

		      x += xdir

		      if do_slope && !slope_move(xdir)
		          return false // We couldn't move on a slope
		}
	}

	return true


}
