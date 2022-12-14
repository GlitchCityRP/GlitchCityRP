
/datum/extension/interactive/os/proc/update_host_icon()
	var/atom/A = holder
	if(istype(A))
		A.update_icon()

/datum/extension/interactive/os/proc/get_screen_icon_file()
	if(istype(holder, /obj/item/modular_computer))
		var/obj/item/modular_computer/MC = holder
		return MC.screen_icon || MC.icon
	if(isatom(holder))
		var/atom/A = holder
		return A.icon

/datum/extension/interactive/os/proc/get_screen_overlay()
	if(!on)
		return image(screen_icon_file, screensaver_icon)
	if(!screen_icon_file)
		screen_icon_file = get_screen_icon_file()
	if(screen_icon_file)
		var/image/I
		if(active_program)
			if(active_program.program_icon_state in icon_states(screen_icon_file))
				I = image(screen_icon_file, active_program.program_icon_state)
			else
				I = image(screen_icon_file, default_icon) //Fallback icon
		else
			I = image(screen_icon_file, menu_icon)
		I.appearance_flags |= RESET_COLOR
		return I
	return image(null)

/datum/extension/interactive/os/proc/get_keyboard_overlay()
	if(!on)
		return
	if(!screen_icon_file)
		screen_icon_file = get_screen_icon_file()
	if(screen_icon_file && active_program && active_program.program_key_state)
		var/image/I = image(screen_icon_file, active_program.program_key_state)
		I.appearance_flags |= RESET_COLOR
		return I
	return image(null)

/datum/extension/interactive/os/proc/visible_error(message)
	var/atom/A = holder
	if(istype(A))
		A.visible_message("<span class='warning'>\The [A]'s screen displays an error: \"[message]\"</span>", range = 1)

/datum/extension/interactive/os/proc/visible_notification(message)
	var/atom/A = holder
	if(istype(A))
		A.visible_message("<span class='notice'>\The [A] screen displays a notification: \"[message]\"</span>", range = 1)

/datum/extension/interactive/os/proc/audible_notification(notification)
	var/atom/A = holder
	if(istype(A))
		playsound(A, notification, 5, falloff = 1)

/datum/extension/interactive/os/proc/show_error(user, message)
	to_chat(user, "<span class='warning'>[message]</span>")
