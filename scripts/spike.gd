extends Trap

@export var MOVEMENT: int = 100
@export var DURATION: float = 2
var current_x: Vector2

func _ready():
   super._ready()
   var curr = global_position
   var left = Vector2(curr.x - MOVEMENT, curr.y)
   var right = Vector2(curr.x + MOVEMENT, curr.y)
   var tween = get_tree().create_tween().set_loops()
   tween.tween_property(self, "global_position", left, DURATION/2)
   tween.tween_property(self, "global_position", right, DURATION/2)
   tween.play()
