//sound for each footstep
if (event_data[? "message"] == "footstep")
{
	audio_play_sound(snd_stepping, 2, false, random_range(0.8, 1.2), false, random_range(0.8, 1.2))	
}

