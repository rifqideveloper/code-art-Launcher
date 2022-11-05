extends VBoxContainer
signal klik(data)
var data : Dictionary
func _ready():
	$nama.text = data["nama"]

func _on_Button_pressed():
	emit_signal("klik",data)
