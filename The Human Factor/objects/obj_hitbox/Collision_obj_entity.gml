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
		}
		else if (type == "attack")
		{
			//Counter
			_target.hp -= owner.damage * 2;
			_target.state = "stunned";
			_target.action_timer = _target.countered_timer;
		}
	}
	else if (type == "attack")
	{
		if _target.state == "blocking" {
			_target.hp -= owner.damage * 0.3;
		}
		else {
			show_debug_message("Smacked enemy! Their HP is now: " + string(_target.hp));
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




