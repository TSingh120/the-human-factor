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
		if (action_type == "block")
		{
			//Parry
			_target.state = "stunned";
			_target.action_timer = 45;
		}
		else if (type == "attack")
		{
			//Counter
			_target.hp -= damage * 2;
			_target.state = "stunned";
			_target.action_timer = 20;
		}
	}
	else if (type == "attack" && _target.state != "stunned")
	{
		if _target.state = "blocking" {
			_target.hp -= damage * 0.3;
		}
		else {
			_target.hp -= damage;
			_target.state = "stunned";
			_target.action_timer = 15;
		}
	}
}




