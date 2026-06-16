// Free memory to prevent memory leaks
if (surface_exists(pause_surf)) surface_free(pause_surf);
if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);

// Reactivate gameplay objects
instance_activate_object(obj_entity);
instance_activate_object(obj_camera);
instance_activate_object(obj_spawnpoint);
instance_activate_object(obj_healthbar);
instance_activate_object(obj_healthbarplayer);
instance_activate_object(obj_guiscaler);































