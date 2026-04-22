if (place_meeting(x, y, Obj_Solid) and vspeed > 0) {
	onGround = 1
}

if (onGround = 1)
	vspeed = 0
else if (onGround = 0) {
	if vspeed < 0
		vspeed += 0.2
	else if (vspeed >= 0 and vspeed < 5)
		vspeed += 0.3
	else
		vspeed = 5
}

if (keyboard_check(ord("D"))) {
	facing = 0
	if (hspeed < 6)
		hspeed += 0.8
	else
		hspeed = 6
}
else if (keyboard_check(ord("A"))) {
	facing = 1
	if (hspeed > -6)
		hspeed -= 0.8
	else
		hspeed = -6
}
else {
	if (hspeed > 0 and facing = 0)
		hspeed -= 0.8
	else if (hspeed < 0 and facing = 1)
		hspeed += 0.8
	else
		hspeed = 0
}

if (keyboard_check_pressed(ord("M")) and onGround = 1) {
	vspeed = -4.5
	onGround = 0
}
