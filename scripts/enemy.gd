class_name Enemy
extends CharacterBody2D

@onready var hit_box = $HitBox
@onready var hurt_box = $HurtBox
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var GRAVITY: float = 200.0

var _player: NinjaFrog

func _ready():
   hit_box.body_entered.connect(_on_hit_box)
   hurt_box.body_entered.connect(_on_hurt_box)
   _player = get_tree().get_first_node_in_group("ninja_frog")
   
func _physics_process(delta):
   if not is_on_floor():
      velocity.y += GRAVITY * delta

func _on_hit_box(body: Node2D) -> void:
   set_physics_process(false)
   print("Enemy hit box: ", body)
   GameManager.on_player_die.emit()
   
func _on_hurt_box(body: Node2D) -> void:
   set_physics_process(false)
   print("Enemy hurt box: ", body)
