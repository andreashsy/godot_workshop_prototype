extends Node2D

@onready var ninja_frog = $NinjaFrog

func _ready():
	var start_group = get_tree().get_nodes_in_group("start_pos")
	var start_pos = start_group.pick_random()
	ninja_frog.global_position = start_pos.global_position

func _on_dead_zone_body_entered(body):
	get_tree().reload_current_scene()
