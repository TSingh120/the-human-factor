var _target = other.id;

//To not hit self
if (_target == owner) return;
if (_target.iframes > 0) return;
if (_target.faction == owner.faction) return;

//If the target hasnt been hit yet
if (ds_list_find_index(hit_list, _target) == -1) {
	ds_list_add(hit_list, _target);
	
	//Check if the target can be parried or countered
	if (_target.state == "winding")
	{
		if (type == "block")
		{
			//Parry
			_target.state = "stunned";
			_target.action_timer = _target.stunned_timer;
			audio_play_sound(snd_parried, 10, false);
			instance_create_layer((x + _target.x) / 2, y, "Instances", obj_parryspark);
		}
		else if (type == "attack")
		{
			//Counter
			if owner.y_speed > 0 {
				_target.hp -= owner.damage*2.5	
			}
			else {
			_target.hp -= owner.damage * 2;
			_target.state = "stunned";
			_target.action_timer = _target.countered_timer;
			}
			audio_play_sound(snd_countered, 10, false);
			instance_create_layer((x + _target.x) / 2, y, "Instances", obj_counterspark);
		}
	}
	else if (type == "attack")
	{
		if _target.state == "blocking" {
			_target.hp -= owner.damage * 0.3;
			audio_play_sound(snd_blocked, 10, false);
		}
		else {
			show_debug_message("Smacked enemy! Their HP is now: " + string(_target.hp));
			audio_play_sound(snd_attacked, 10, false);
			if owner.y_speed > 0 {
				_target.hp -= owner.damage*1.5;
			}
			else {
			_target.hp -= owner.damage;
			_target.image_index = 0;
			_target.action_timer = 30;
			}
		}
	}
}




