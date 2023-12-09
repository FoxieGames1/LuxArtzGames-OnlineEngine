function scrControls() 
{
	if (gamepad_is_connected(0))
	{gamepad_set_axis_deadzone(0,0.5)}
	
	global.KeyUp		= keyboard_check(vk_up)		|| input_gamepad_check(0, gp_padu) || input_gamepad_check(4, gp_padu)
	global.KeyDown		= keyboard_check(vk_down)	|| input_gamepad_check(0, gp_padd) || input_gamepad_check(4, gp_padd) 
	global.KeyLeft		= keyboard_check(vk_left)	|| input_gamepad_check(0, gp_padl) || input_gamepad_check(4, gp_padl)
	global.KeyRight		= keyboard_check(vk_right)	|| input_gamepad_check(0, gp_padr) || input_gamepad_check(4, gp_padr)
	
	global.JoyUp        = (gamepad_axis_value(0, gp_axislv) < 0)
	global.JoyDown      = (gamepad_axis_value(0, gp_axislv) > 0)
	global.JoyLeft      = (gamepad_axis_value(0, gp_axislh) < 0)
	global.JoyRight     = (gamepad_axis_value(0, gp_axislh) > 0)

	global.KeyUpP		= keyboard_check_pressed(vk_up)		|| input_gamepad_check_pressed(0, gp_padu) || input_gamepad_check_pressed(4, gp_padu)
	global.KeyDownP		= keyboard_check_pressed(vk_down)	|| input_gamepad_check_pressed(0, gp_padd) || input_gamepad_check_pressed(4, gp_padd) 
	global.KeyLeftP		= keyboard_check_pressed(vk_left)	|| input_gamepad_check_pressed(0, gp_padl) || input_gamepad_check_pressed(4, gp_padl)
	global.KeyRightP	= keyboard_check_pressed(vk_right)	|| input_gamepad_check_pressed(0, gp_padr) || input_gamepad_check_pressed(4, gp_padr)

	global.KeyJumpP		= keyboard_check_pressed(ord("Z"))  || input_gamepad_check_pressed(0,  gp_face1) || input_gamepad_check_pressed(4,  gp_face1)
	global.KeyJumpR		= keyboard_check_released(ord("Z")) || input_gamepad_check_released(0, gp_face1) || input_gamepad_check_released(4, gp_face1)
}
