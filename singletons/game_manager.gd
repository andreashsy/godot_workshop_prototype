extends Node

signal on_score(reward: int)

var score: int = 0

func add_reward(reward: int) -> void:
   score += reward
   on_score.emit(score)
