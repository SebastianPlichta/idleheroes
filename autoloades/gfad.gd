extends Node

var click:bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	click = Input.is_action_just_pressed("leftClick")
