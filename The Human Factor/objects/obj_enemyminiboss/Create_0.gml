facing_dir = 1;
move_dir = 0; 
move_speed = 3;
dash_speed = 10;
x_speed = 0;
y_speed = 0;
term_vel = 15;
jump_speed = -12;
gravity_speed = 0.35;
iframes = 0;
detection_range = 400;
jump_count = 0;

max_hp = 20;
hp = max_hp;
phase = 1;
state = "idle";
action_timer = 0;
faction = "hostile";
knockback_speed = 0;
jumping_duration = 0;
damage = 15;
stunned_timer = irandom_range(90, 210);
countered_timer = irandom_range(40, 100);

victim = obj_player;
decision_cooldown = 30;