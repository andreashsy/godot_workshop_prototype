class_name Fruit
extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var reward: int = 3
@export var fruit: FRUIT

enum FRUIT { APPLE, BANANA, MELON }

var _fruit: Array = ["apple", "banana", "melon" ]

# Called when the node enters the scene tree for the first time.
func _ready():
   animated_sprite_2d.play(_fruit[fruit])
   body_entered.connect(_on_body_entered)
   
func _on_body_entered(body: Node2D) -> void:
   print("reward")
   body_entered.disconnect(_on_body_entered)
   animated_sprite_2d.play("collected")
   GameManager.add_reward(reward)
   animated_sprite_2d.animation_finished.connect(func(): call_deferred("queue_free"))
