function playerStateAir() {
	if state_is_new
	{
		state_is_new = !state_is_new
	}

	if on_ground() && yvel >= 0
	{
		state_current = playerStateGround
		exit;
	}

	yvel += grav

	if yvel > terminal_velocity
		yvel = terminal_velocity

	if global.KeyJumpR && jump_cooldown = false && global.PlayerStop=false
	{
		if (yvel < 0) {yvel *= 0.5}
		jump_cooldown=true	
	}
}
