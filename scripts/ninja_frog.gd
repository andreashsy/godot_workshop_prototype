class_name NinjaFrog
extends CharacterBody2D

@export var GRAVITY: float = 500
@export var RUN_SPEED: float = 150
@export var JUMP: float = 300

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_player = $AudioPlayer

func _physics_process(delta):
   
   var dir
   var anim = "idle"
   
   if not is_on_floor():
      velocity.y += GRAVITY * delta
      anim = "fall"
      
   else:
      dir = Input.get_axis("left", "right")
      velocity.x = RUN_SPEED * dir
      
      if 0 != dir:
         anim = "run"
         animated_sprite_2d.flip_h = dir < 0
      
      if Input.is_action_just_pressed("jump"):
         velocity.y = -JUMP
         anim = "jump"
         audio_player.play()
      
   velocity.y = min(velocity.y, GRAVITY)
   velocity.x = min(velocity.x, RUN_SPEED)
   
   move_and_slide()
   animated_sprite_2d.play(anim)
