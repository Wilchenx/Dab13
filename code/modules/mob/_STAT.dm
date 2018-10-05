var
  worldstarttime = 0
  worldstarttimeofday = 0

/mob/Stat() //human.dm line 147
	..()
	if (!worldstarttime || worldstarttimeofday)
		worldstarttime = world.time
		worldstarttimeofday = world.timeofday
	if(statpanel("Status"))
		if(ticker)
			if(ticker.current_state == GAME_STATE_SETTING_UP)
				stat(null, "Gamemode : [ticker.mode ? ticker.mode.name : "Not Chosen"]")
		stat("Status",null)
		if(client)
			stat(null, "Ping : [client.ping] ms")
		stat(null, "Server time of day : [time2text(world.timeofday)]")
		stat(null, "Server CPU : %[world.cpu]")
		stat(null, "Players Online : [clients.len]/[MAX_PLAYERS]")
		if(!STORM)
			if(istype(src,/mob/living))
				stat(null, "Air : %[round(air*2)]")
				stat(null, "Nutrition : %[max(0,min(100,round(nutrition)))]")
				stat(null, "Weight : [round(weight,0.125)] KG")
		else
			stat(null, "Storm eye closing in [max(0,round(STORM.timer_left))] secs")
		//stat(null, "Shield : %[round(shield)]")
		if(veh)
			stat("Vehicle Speed","[round(veh.velocity.SquareMagnitude()/50)] km/h")
			if(veh.Kart)
				stat("Racing status",null)
				stat(null, "Lap : [veh.lap]")
				stat(null, "Lap completed : %[(veh.checkpoint/8)*100]")
				stat("Other people",null)
				for(var/obj/machinery/vehicle/k in karts)
					if(k.Kart == 1)
						stat(null, "[k.name] - [k.lap] - %[(k.checkpoint/8)*100]")

	if(statpanel("Debugging information")) //Debug.
		var/tickdrift = (world.timeofday - worldstarttimeofday) - (world.time - worldstarttime)  / tick_lag_original
		stat("MAIN",null)
		stat(null, "Frame [frm_counter]")
		stat(null, "Bullets : [bullets.len]")
		stat(null, "Particles : [PARTICLE_LIST.len]")
		stat(null, "3D Position : [x], [round(heightZ)], [y]")
		stat(null, "Server CPU : %[world.cpu] - [world.tick_usage]")
		stat(null, "Server Time : [time2text(world.realtime)]")
		stat(null, "Tick Drift : [tickdrift]")
		if(client)
			stat(null, "Frames Per Second : [world.fps] FPS - [frm_counter % world.fps] / [world.fps]")
			stat(null, "Next move : [max((client.move_delay-world.time)*10,0)]")
		if(master_controller)
			stat("MASTER",null)
			stat(null, "Master timer : [master_controller.wait]")
			stat(null, "Actions done : [actions_per_tick]")
			stat(null, "Processed : [master_Processed]")
			stat(null, "Max actions : [round(max_actions - ((max(0,min(world.cpu,100))/100)*(max_actions/2)*(CPU_warning)))][CPU_warning ? " (THROTTLED)" : ""]")
		if(air_master)
			stat("ATMOS",null)
			stat(null, "Processed : [atmos_processed]")
			stat(null, "Actions done : [actions_per_tick_atmos]")
			stat(null, "Max actions : [max_actions_atmos]")
		if(water_master)
			stat("WATER",null)
			stat(null, "Processed : [water_processed]")
			stat(null, "Actions done : [actions_per_tick_water]")
			stat(null, "Max actions : [round(max_actions_water - ((max(0,min(world.cpu,50))/50)*(max_actions_water/1.5)))]")