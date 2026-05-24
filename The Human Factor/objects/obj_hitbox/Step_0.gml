//Lifetime countdown

lifetime--;

if lifetime <= 0 {
	ds_list_destroy(hit_list);
	instance_destroy();
}
