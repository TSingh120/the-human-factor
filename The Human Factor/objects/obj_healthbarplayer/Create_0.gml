if !instance_exists(obj_player) { return }

health_points_max = obj_player.max_hp;
health_points = health_points_max;
health_points_prev = health_points_max;

followup_timermax = 60;
followup_timer = 0;
