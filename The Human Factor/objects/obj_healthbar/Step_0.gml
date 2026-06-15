if instance_exists(obj_enemyminiboss) {
    if (health_points > obj_enemyminiboss.hp) {
        followup_timer = followup_timermax;
    }
    
    health_points = obj_enemyminiboss.hp;
} else {
    instance_destroy();
    return;
}

//Decrease timer (follow up thing)
followup_timer = clamp(followup_timer -1, 0, followup_timermax);

//Adjust follow up bar
if followup_timer == 0 {
	health_points_prev = lerp(health_points_prev, health_points, 0.2);
}








