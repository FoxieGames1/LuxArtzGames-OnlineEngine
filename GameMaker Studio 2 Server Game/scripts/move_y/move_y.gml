///@func move_y(yvel, [instance])
///@arg yvel
///@arg [instance]
function move_y() {

	var yvel    = argument[0]
	var ydir    = sign(yvel)
	var instance = self

	switch (argument_count)
	{
	    case 2: instance = argument[1];
	}

	repeat(abs(yvel))
	{
		with(instance)
		{
	        // Going down
	        if ydir && on_ground()
				return false
        
			if !ydir && wall_above()
				return false
		
			y += ydir
	    }
	}

	return true


}
