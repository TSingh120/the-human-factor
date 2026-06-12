//disable alpha blending	 (we just want rgb from screen)
gpu_set_blendenable(false);

if (pause) //draw the frozen image to the screen while paused
{
	surface_set_target(application_surface);
		if (surface_exists(pause_surf)) draw_surface(pause_surf, 0, 0);
		else //restore from buffer if we lost the surface
		{
			pause_surf = surface_create(res_w, res_h);
			buffer_set_surface(pause_surfbuffer, pause_surf, 0);
		}
	surface_reset_target();
}

if (keyboard_check_pressed(vk_backspace)) //Toggle pause (whatever condition/trigger you like)
{
	if (!pause) //pause now
	{
		pause = true;
		
		//deactivate everything other than this instance
		instance_deactivate_all(true);
		
		//NOTE:
		//if you need to pause anything like sprites tiles room backgrounds etc you need to that seperately unfortunately
		
		//capture this game moment (wont capture draw gui contents though)
		pause_surf = surface_create(res_w, res_h);
		surface_set_target(pause_surf);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		//Back up this surface buffer in case we lose it (screen focus etc)
		if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
		pause_surfbuffer = buffer_create(res_w * res_h * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surfbuffer, pause_surf, 0);
	}
	else //unpause now
	{
		pause = false;
		instance_activate_all();
		if (surface_exists(pause_surf)) surface_free(pause_surf);
		if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
	}
}

//Enable alpha blending again
gpu_set_blendenable(true);