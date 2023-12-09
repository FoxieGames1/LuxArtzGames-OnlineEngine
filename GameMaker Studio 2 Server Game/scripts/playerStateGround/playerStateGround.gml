function playerStateGround() {
	if state_is_new
	{
		yvel		 = 0
		yvel_fract	 = 0
		jump_cooldown = false
	
		state_is_new = !state_is_new
	}

	if !on_ground()
	{
		state_current = playerStateAir
		exit;
	}

	if (global.KeyJumpP && global.PlayerStop=false) && !(global.KeyDown || global.JoyDown)
	{
		ground = true;
		if Gummy = true
		{scrGummy(0.75, 1.25)}
		// Player is standing completely on a one-way platform
			yvel = -jump_speed
			jump_frame = true
		state_current = playerStateAir
		exit
	}
}
