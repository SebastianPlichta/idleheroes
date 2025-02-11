extends Node2D

class_name UpgradeMenu
var tween:Tween
@onready var texture = $Polygon2D

func _ready() -> void:
	hideMenu()

func showMenu() -> void:
	visible = true
	animation(Vector2(1,1), false)
	
func hideMenu() -> void:
	animation(Vector2(0.1,0.1), true)

func animation(scale:Vector2, callback:bool) -> void:
	if tween:
		tween.kill()
		
	tween = create_tween().set_trans(Tween.TransitionType.TRANS_QUAD)
	
		
	tween.tween_property(texture, "scale", scale,0.5)
	
	if callback: #set callback
		tween.tween_callback(func(): visible = false)
