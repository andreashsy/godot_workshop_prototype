class_name Item
extends Area2D

@export var REWARD: int = 5

@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_body_entered(body):
   print(">>> reward: ", REWARD)
   body_entered.disconnect(_on_body_entered)
   animated_sprite_2d.play("collected")
   GameManager.add_reward(REWARD)
   await animated_sprite_2d.animation_finished
   queue_free()
