//Hitbox Variables
owner = noone; //Who spawned ts bro
action_type = "attack";
damage = 2;
lifetime = 7;
hit_list = ds_list_create();  //to check if the enemy has been attacked during the life time and make it so the hitbox doesnt damage the same dude every single frame of the lifetime

owner = "none";
type = "none";
