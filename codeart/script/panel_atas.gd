extends HBoxContainer

export (NodePath) var alat : NodePath
export (NodePath) var akun : NodePath
export (NodePath) var game_list : NodePath
export (NodePath) var app_halama : NodePath
export (NodePath) var pop_up_download : NodePath
signal pencarian (text)
func _on_alat_pressed():
	get_node(alat).visible = true
	get_node(akun).visible = false
	get_node(game_list).visible = false
	get_node(app_halama).visible = false

func _on_download_luncher_pressed():
	get_node(pop_up_download).visible = true
	pass


func _on_akun_pressed():
	get_node(alat).visible = false
	get_node(akun).visible = true
	get_node(game_list).visible = false
	get_node(app_halama).visible = false


func _on_LineEdit_text_entered(new_text):
	emit_signal("pencarian",new_text)
	
