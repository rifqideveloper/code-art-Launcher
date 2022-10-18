extends VFlowContainer
signal update(b)
var app : PackedScene = preload("res://codeart/scene/app.tscn")
export(NodePath) var app_halaman : NodePath
var list : Array = [
	{"nama":"free person shooter"}
]

func _ready():
	connect("update",self,"_update")
	update()
	
func _klik(data:Dictionary) -> void :
	visible = false
	get_node(app_halaman).visible = true


func update() -> void :
	for i in list :
		var v = app.instance()
		v.data = i
		v.connect("klik",self,"_klik")
		add_child(v)
		
