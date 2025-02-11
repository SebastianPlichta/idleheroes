extends Node2D

class_name collisionComponent

@export var object:Buildings
@export var menu:UpgradeMenu
var mouse:bool = false
var tween:Tween

func _ready() -> void:
	object.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	object.connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _process(delta: float) -> void:
	if mouse:
		if Gfad.click:
			menu.showMenu()

func _on_mouse_entered():
	mouse = true
	animation(mouse)
	
func _on_mouse_exited():
	mouse = false
	animation(mouse)


#                        ---Animation---

func animation(mouse:bool):
	if tween:
		tween.kill()
		
	tween = create_tween().set_trans(Tween.TransitionType.TRANS_ELASTIC)
	
	if mouse:
		tween.tween_property(object.texture, "scale", Vector2(1.2,1.2),0.3)
		return
	tween.tween_property(object.texture, "scale", Vector2(1,1),0.3)
