extends CanvasLayer

@onready var value = $MarginContainer/Score/HBoxContainer/Value

func _ready():
   GameManager.on_score.connect(_on_score)
   update_score(GameManager.score)
   
func _on_score(score: int) -> void:
   update_score(score)
   
func update_score(score: int) -> void:
   value.text = "%d" %score
