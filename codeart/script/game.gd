extends Node

export var link : String

func _ready() -> void:
	if ProjectSettings.load_resource_pack(link,true) :
		print("pck ditemukan")
		#dir_contents("res://")
		get_tree().change_scene_to(ResourceLoader.load("res://scene//main.tscn"))
	else :
		print("pck tidak ditemukan")

func dir_contents(path) -> void:
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
