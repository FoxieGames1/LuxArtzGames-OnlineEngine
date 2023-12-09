///@func move_platform_y(yvel_int)
///@arg yvel
function move_platform_y() {

	var yvel    = argument[0]
	var ydir    = sign(yvel)

	repeat(abs(yvel))
	{
		// Colliding with solid
	    if coll_y(ydir)
			return false

		// Keep track of all the instances we should move
		var instances_to_move = ds_list_create()

		// Create the collision list
		var instances_ds = ds_list_create()

		// Going downward
		if ydir
		{
			// Players below (we need to push them down)
			var num_found = coll_y_list(ydir, instances_ds, objPlayer)
		
			for( var i = 0; i < num_found; i++ )
			{
				var instance_to_move = instances_ds[| i]
			
				ds_list_add(instances_to_move, instance_to_move)
				
				if false == move_y(ydir, instance_to_move)
				{
					instances_reset_position(instances_to_move)
					ds_list_destroy(instances_to_move)
					
					ds_list_destroy(instances_ds)
					return false
				}
			}

			// Clear list
			ds_list_clear(instances_ds)
		
			// Players above (we need to carry them)
			num_found = coll_y_list(-1, instances_ds, objPlayer)
		
			instance_deactivate_object(self)
			for( var i = 0; i < num_found; i++ )
			{
				var instance_to_move = instances_ds[| i]
				move_y(ydir, instance_to_move)
			}
			instance_activate_object(self)
		}
	
		// Going upward
		if !ydir
		{
			// Players above (push upward)
			num_found = coll_y_list(ydir, instances_ds, objPlayer)
		
			for( var i = 0; i < num_found; i++ )
			{
				var instance_to_move = instances_ds[| i]
			
				ds_list_add(instances_to_move, instance_to_move)
				
				if false == move_y(ydir, instance_to_move)
				{
					instances_reset_position(instances_to_move)
					ds_list_destroy(instances_to_move)
					
					ds_list_destroy(instances_ds)
					return false
				}
			}
		}
	
		// Update xprevious and yprevious with new positions
		instances_update_previous_position(instances_to_move)
	
		// Cleanup the moved instances list
		ds_list_destroy(instances_to_move)
	
		// Cleanup the collision list
		ds_list_destroy(instances_ds)
			
		y += ydir
	}

	return true


}
