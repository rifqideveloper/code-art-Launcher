extends Control

signal ke_app_halaman(nama)
var app : PackedScene = preload("res://codeart/scene/app_dipilih.tscn")
var data : Dictionary
var app_list : Array = [
	
]

func _ready() -> void:
	_app_list_update()

func _app_list_update() -> void :
	
	for i in data["link"].keys() :
		app_list.push_back([i,data["link"][i]])
		
	for i in range($VBoxContainer/HBoxContainer/HFlowContainer.get_child_count() - 1) :
		var v : Node = $VBoxContainer/HBoxContainer/HFlowContainer.get_child(i)
		$VBoxContainer/HBoxContainer/HFlowContainer.remove_child(v)
		v.queue_free()
	for i in app_list :
		var v : Node = app.instance()
		print("list",i)
		#v.nama = i[0]
		#v.link = i[1]
		v.data = {
			"nama":i[0]
			,"link":i[1]
		}
		v.connect("ke_app_halaman",self,"_ke_app_halaman")
		$VBoxContainer/HBoxContainer/HFlowContainer.add_child(v)
	
	
	$VBoxContainer/HBoxContainer/HFlowContainer.add_child(load("res://codeart/scene/tambah_app.tscn").instance())

func _ke_app_halaman(nama:Dictionary) -> void :
	emit_signal("ke_app_halaman",nama)
