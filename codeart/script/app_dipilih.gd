extends Button
signal ke_app_halaman (nama)

var data : Dictionary

func _ready():
	pass


func _on_app_pressed() -> void:
	emit_signal("ke_app_halaman",data)
	pass # Replace with function body.
