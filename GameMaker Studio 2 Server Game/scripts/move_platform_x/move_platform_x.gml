///@func move_platform_x(xvel_int)
///@arg xvel
function move_platform_x() {

	var xvel    = argument[0]
	var xdir    = sign(xvel)

	// Movement/Collision X
	repeat(abs(xvel))
	{
		// Colliding with solid
		if coll_x(xdir)
			return false
		
		// Keep track of all the instances we should move
		var instances_to_move = ds_list_create()
	
		// Create the collision list
		var instances_ds = ds_list_create()
	
		// Players found on the sides
		var num_found = coll_x_list(xdir, instances_ds, objPlayer)
	
		// Try pushing all the entities
		for( var i = 0; i < num_found; i++ )
		{
			var instance_to_move = instances_ds[| i]			// Get the instance from the list
			
			ds_list_add(instances_to_move, instance_to_move)
			
			if false == move_x(xdir, true, instance_to_move)	// Try moving it but if it cannot move
			{	
				instances_reset_position(instances_to_move)
				ds_list_destroy(instances_to_move)
					
				ds_list_destroy(instances_ds)					// Always cleanup DS before returning
				return false									// Stop execution and avoid moving platform
			}
		}

		// Reset the list content
		ds_list_clear(instances_ds)
	
		// Players on top
		num_found = coll_y_list(-1, instances_ds, objPlayer)
	
		// Try carrying the players
		for( var i = 0; i < num_found; i++ )
		{
			var instance_to_move = instances_ds[| i]			// Get the instance from the list
			move_x(xdir, true, instance_to_move)				// Try moving it
		}
	
		// Update xprevious and yprevious with new positions
		instances_update_previous_position(instances_to_move)

		// Cleanup the moved instances list
		ds_list_destroy(instances_to_move)
	
		// Cleanup the collision list
		ds_list_destroy(instances_ds)

		// Finally move the platform
		x += xdir
	}

	return true


}
