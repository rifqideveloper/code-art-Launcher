extends Control

#var beranda : PackedScene = preload("res://codeart/scene/beranda.tscn")

func _ready():
	OS.set_window_title("code art")
	#$dokumen.connect("buka_gui",self,"_buat_gui")
	pass

func _segarkan() ->void :
	if $VBoxContainer.get_child_count() == 2 :
		var v = $VBoxContainer.get_child(1)
		$VBoxContainer.remove_child(v)
		v.queue_free()

func _buat_gui(data:Dictionary) -> void :
	pass
	#_segarkan()
	#var v = beranda.instance()
	#3v.data = data
	#v.connect("ke_app_halaman",self,"_buat_halaman_app")
	#$VBoxContainer.add_child(v)
	
func _buat_halaman_app(data:Dictionary) -> void :
	_segarkan()
	var v :Node= load("res://codeart/scene/app_halaman.tscn").instance()
	v.link = data["link"]
	v.nama = data["nama"]
	$VBoxContainer.add_child(v)
