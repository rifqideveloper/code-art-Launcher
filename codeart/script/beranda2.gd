extends VFlowContainer
signal update(b)
const app : PackedScene = preload("res://codeart/scene/app.tscn")
#export(NodePath) var app_halaman : NodePath
const list : Array = [
	{
	"nama":"free person shooter",
	"link":"https://rifqideveloper.github.io/free-person-shooter/index.pck",
	"link_sha256":"https://rifqideveloper.github.io/free-person-shooter/index.sha256",
	"user_date":"user://game",
	"descripsi" : "",
	"icon":"https://rifqideveloper.github.io/free-person-shooter/index.144x144.png",
	"background":"https://rifqideveloper.github.io/free-person-shooter/index.512x512.png",
	"depedensi":{},
	"spec":{}
	}
]

func _ready():
	connect("update",self,"_update")
	_update("")
	$"../panel_atas".connect("pencarian",self,"_update")
	
func _klik(data:Dictionary) -> void :
	visible = false
	var v = $"../app_halaman2"
	v.link = data["link"]
	v.link_sha256 = data["link_sha256"]
	v.nama = data["nama"]
	v.user_date = data["user_date"]
	v.icon = data["icon"]
	v.backgroun = data["background"]
	v.visible = true


func _update(pencarian:String) -> void :
	for i in range(get_child_count()) :
		var v = get_child(i)
		remove_child(v)
		v.queue_free() 
	for i in list :
		if pencarian.empty() or i["nama"].begins_with(pencarian):
			var v = app.instance()
			v.data = i
			v.connect("klik",self,"_klik")
			add_child(v)
		
