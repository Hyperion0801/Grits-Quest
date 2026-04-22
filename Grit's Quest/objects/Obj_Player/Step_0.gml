if (place_meeting(x + 1, y - 10, Obj_Solid) and facing = 0) {
	hspeed = 0
	wallDetected = 1
}
else if (place_meeting(x - 1, y - 10, Obj_Solid) and facing = 1) {
	hspeed = 0
	wallDetected = 2
}
else
	wallDetected = 0

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

if (keyboard_check(ord("D")) and wallDetected != 1) {
	facing = 0
	image_xscale = 1
	if (hspeed < 6)
		hspeed += 0.8
	else
		hspeed = 6
	wallDetected = 0
}
else if (keyboard_check(ord("A")) and wallDetected != 2) {
	facing = 1
	image_xscale = -1
	if (hspeed > -6)
		hspeed -= 0.8
	else
		hspeed = -6
	wallDetected = 0
}
else {
	if (hspeed > 0 and facing = 0)
		hspeed -= 0.8 * friction_
	else if (hspeed < 0 and facing = 1)
		hspeed += 0.8 * friction_
	else
		hspeed = 0
}

if (keyboard_check_pressed(ord("M")) and onGround = 1) {
	vspeed = -4.5
	onGround = 0
	friction_ = 0.33
}

if (place_meeting(x, y - 9.666, Obj_Solid) and vspeed > 0) {
	onGround = 1
	friction_ = 1
	vspeed = 0
	
	while (place_meeting(x, y - 9.666, Obj_Solid))
		y -= 0.2
}

if (keyboard_check_pressed(ord("R")))
	room_goto(0)
