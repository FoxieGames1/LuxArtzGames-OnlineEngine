///@func instances_update_previous_position(instances_to_move)
function instances_update_previous_position() {

	var instances_to_move	= argument[0]
	var num_of_instances	= ds_list_size(instances_to_move)
	var index				= 0

	repeat(num_of_instances)
	{
		var instance			= instances_to_move[| index]
		instance.xprevious		= instance.x
		instance.yprevious		= instance.y
		index++
	}



}
