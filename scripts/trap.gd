class_name Trap
extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var animation_player = $AnimationPlayer
@onready var audio_player = $AudioPlayer

@export var HURT: int = 3

func _ready():
   body_entered.connect(_on_body_entered)
   
func _on_body_entered(node: Node2D) -> void:
   GameManager.add_reward(-HURT)
   print("trap: ", node)
   audio_player.play()
   
