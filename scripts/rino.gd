class_name Rino
extends Enemy

@export var SPEED: float = 300

@onready var player_detector = $PlayerDetector

var _charge: bool = false
var _charge_distance: float = 0
var facing: int = 0

func _ready():
   super._ready()
   
func _physics_process(delta):
   super._physics_process(delta)
   
   velocity.y = min(velocity.y, GRAVITY)
   
   var anim = "idle"
   if _charge:
      velocity.x = facing * SPEED
      anim = "run"
   
   _face_player()
   
   move_and_slide()
   
   animated_sprite_2d.play(anim)
   
   _should_charge()
   
func _face_player() -> void:
   facing = sign(_player.global_position.x - global_position.x)
   animated_sprite_2d.flip_h = facing > 0
   player_detector.rotation = PI if animated_sprite_2d.flip_h else 0
   
func _should_charge() -> void:
   _charge = player_detector.is_colliding()
   
func die() -> void:
   print("after play hurt")
   animated_sprite_2d.play("hurt")
   await get_tree().create_timer(1).timeout
   queue_free()
   
func _on_hurt_box(body: Node2D) -> void:
   super._on_hurt_box(body)
   call_deferred("die")
