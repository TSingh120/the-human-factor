event_inherited();
jumping_duration--;

if hp = max_hp/2 && phase == 1 
 {
	phase = 2;
	
	move_speed = 3.5;
	dash_speed = 12;
	
	state = "blocking";
    action_timer = 60; 
    var _blockbox = instance_create_layer(x + (facing_dir * 12), y - 20, "Instances", obj_hitbox);
    _blockbox.owner = id;
    _blockbox.type = "block";
    _blockbox.lifetime = 60;
    _blockbox.image_xscale = facing_dir;
	
	//audio_play_sound(gooning ahahaha, what the hell are you on about, i dont know man)
}

var _dist = distance_to_object(obj_player);

if (state == "idle") {
    if (victim.x > x) facing_dir = 1;
    else facing_dir = -1;
    
    if (decision_cooldown > 0) 
	{
        decision_cooldown--;
        if (_dist > 60) { x_speed = facing_dir * move_speed; }
		else if _dist > 25 { x_speed += facing_dir * move_speed/4; }
		else if _dist < 25 { x_speed = 0 }
    } 
    else {
        //no cooldown ai makes decision or something i dont know im so tired and they still arent sending me the voice lines bro
        
        var _rng = irandom(100);
			if phase == 1 {
		        if (_dist < 25) {
		            if (_rng < 80) {
		                state = "winding";
		                action_timer = irandom_range(5, 15); //5 to 15 frames to counter or parry 
		                audio_play_sound(snd_raisesound, 3, false);
		            } 
		            else {
		                state = "blocking";
		                action_timer = 60; 
		                var _blockbox = instance_create_layer(x + (facing_dir * 12), y - 20, "Instances", obj_hitbox);
		                _blockbox.owner = id;
		                _blockbox.type = "block";
		                _blockbox.lifetime = 60;
		                _blockbox.image_xscale = facing_dir;
		                audio_play_sound(snd_blockwhoosh, 5, false);
		            }
		        } 
		        else if (_dist >= 80 && _dist < 200) {
		            decision_cooldown = 10;
		        }
				else {
					if _rng < 30 {
						state = "dashing";
						action_timer = 5;
						audio_play_sound(snd_dash, 8, false)
					}
					else if _rng > 30 && _rng < 60 {
						state = "blocking"
						action_timer = 90;
						var _blockbox = instance_create_layer(x + (facing_dir * 12), y - 20, "Instances", obj_hitbox);
		                _blockbox.owner = id;
		                _blockbox.type = "block";
		                _blockbox.lifetime = 90;
		                _blockbox.image_xscale = facing_dir;
		                audio_play_sound(snd_blockwhoosh, 5, false);
					}
					else if _rng > 60 && _dist < 25 {
						state = "winding";
		                action_timer = irandom_range(5, 15); //5 to 15 frames to counter or parry 
		                audio_play_sound(snd_raisesound, 3, false);
						
					}
				}
			}
			
			else if phase == 2 
			{
				
				if (_dist < 45) {
		            if (_rng < 85) {
		                state = "winding";
		                action_timer = irandom_range(3, 10); //5 to 15 frames to counter or parry 
		                audio_play_sound(snd_raisesound, 3, false);
		            } 
		            else {
		                state = "blocking";
		                action_timer = 30; 
		                var _blockbox = instance_create_layer(x + (facing_dir * 15), y - 20, "Instances", obj_hitbox);
		                _blockbox.owner = id;
		                _blockbox.type = "block";
		                _blockbox.lifetime = 30	;
		                _blockbox.image_xscale = facing_dir;
		                audio_play_sound(snd_blockwhoosh, 5, false);
		            }
		        } 
		        else if (_dist >= 80 && _dist < 200) {
		            decision_cooldown = 0;
		        }
				else {
					if _rng < 80 {
						state = "dashing";
						action_timer = 5;
						audio_play_sound(snd_dash, 8, false)
					}
					else 
						{ 
			              state = "dashing";
			              action_timer = 5; 
			              audio_play_sound(snd_dash, 8, false);
						}	
				}
				
			}
	}
}
else if state == "winding" {
	action_timer--;
	if action_timer <= 0 {
			//winding finished, spawn hitbox
		var _hitbox = instance_create_layer(x + (facing_dir * 12), y - 20 , "Instances", obj_hitbox);
		_hitbox.owner = id;
		_hitbox.type = "attack";
		_hitbox.image_xscale = facing_dir;
		//actually attack
		state = "attacking"; 
		action_timer = irandom_range(10, 20); // 60 frames of follow-through swing
		image_index = 0;   // Reset animation for the swing
		audio_play_sound(snd_swordwhoosh, 5, false);
	}
}
else if (state == "attacking") 
{
	action_timer--;
	if (action_timer <= 0) state = "idle";
	decision_cooldown = 45;
	x_speed = 0;
}
else if (state == "blocking") 
{
	action_timer--;
	if (action_timer <= 0) state = "idle";
	decision_cooldown = 30;
	x_speed = 0;
}
else if state == "dashing"
{
	x_speed = facing_dir * dash_speed;
	action_timer--;
	
	//Spawning dust
	if (action_timer % 4 == 0) instance_create_layer(x, bbox_bottom, "Instances", obj_landingdust);
	if action_timer < 0 { 
		state = "idle"
		decision_cooldown = 15;
	}
}
else if (state == "stunned") 
{
	action_timer--;
	if (action_timer <= 0) state = "idle";
	x_speed = 0;
}


//x collisions

	var _subpixel = 0.5;
	if place_meeting(x+ x_speed, y, obj_wallmy)
	{
		//Scoot up to wall precisely
		var _pixelcheck = _subpixel * sign(x_speed);
		while !place_meeting(x + _pixelcheck, y , obj_wallmy)
		{
			x += _pixelcheck;
		}
		
		//Set x speed to 0 to collide
		x_speed = 0;
		
	}

	//Move
	x += x_speed;

//Apply gravity to the player
		y_speed += gravity_speed;
		if y_speed > term_vel { y_speed = term_vel;	};
		
		//Y Collision
	var _subpixel = 0.5;
	if place_meeting(x, y + y_speed, obj_wallmy)
	{
		//Scoot up to the wall precisely
		var _pixelcheck = _subpixel * sign(y_speed);
		while !place_meeting(x, y + _pixelcheck, obj_wallmy)
		{
			y += _pixelcheck;
		}
		//Set y speed 0 to collide
		y_speed = 0;
		
	}
	
	
	//Check grounded state
	if y_speed >= 0 && place_meeting(x, y+1, obj_wallmy)
	{
		on_ground = true;
		jump_count = 1;
	}
	else {on_ground = false}
	if on_ground && (!place_meeting(x+1, y+1, obj_wallmy) || !place_meeting(x-1, y+1, obj_wallmy)) || (place_meeting(x+1, y-1, obj_wallmy) || place_meeting(x-1, y-1, obj_wallmy))
	{
		if jump_count > 0 {y_speed = jump_speed;}
	jump_count--;
}
if (!on_ground) {
    y_speed += gravity_speed;
    if (y_speed > term_vel) y_speed = term_vel;
}
	
	//Move
	y += y_speed;
	
	
	image_xscale = facing_dir;
	
		switch (state) 
{		
	case "winding":
		sprite_index = spr_minibosswinding;
		break;
		
	case "attacking":
		sprite_index = spr_minibossattack;
		break;
		
	case "blocking":
		sprite_index = spr_minibossblock;
		break;
		
	case "stunned":
		sprite_index = spr_minibossstun;
		break;
		
	case "idle":
		sprite_index = spr_minibossidle;
		break;
		
	case "dashing":
		sprite_index = spr_minibossdash;
		break;
}

	if state == "idle" && abs(x_speed) > 0 { sprite_index = spr_minibossrun }
	else if state == "idle" && x_speed = 0 { sprite_index = spr_minibossidle }
	else if state == "idle" && !on_ground { sprite_index = spr_minibossjump }
	
	if hp <= 0 {
		instance_destroy();
		instance_create_layer(x,  y, "managing_stuff", obj_warp_doorkey)
	}