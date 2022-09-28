extends Node
signal buka_gui(data)
var data : Dictionary = {
	"ver" : 0.1,
	"data" : "user://game",
	"link":{
		
	},
	"des" : {
		
	},
	"icon" : {
		
	},
	"background" : {
		
	}
}

const dat : String = "user://data_code_art.dat"
func _ready():
	if File.new().file_exists("./data/Free Person shooter.pck") :
		Directory.new().copy("./data/Free Person shooter.pck", data["data"] + "/Free Person shooter.pck")
		print("file test ada")
	var f : File = File.new()
	if OK == f.open(dat,File.READ_WRITE):
		var v = f.get_var()
		if data["ver"] != v["ver"] :
			data = v
		
	elif OK == f.open(dat,File.WRITE):
		print("buat baru")
	else:
		print("error")		
	var dir = Directory.new()
	if dir.open(data["data"]) == OK:
		dir.list_dir_begin()
		var file_name : String = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".pck") :
				var v = file_name.replace(".pck","")
				data["link"][v] = data["data"] +"/"+ file_name
				print("Found pck file: " ,data["link"][v])
			elif file_name.ends_with(".webp.icon"):
				var v = file_name.replace(".webp.icon","")
				data["icon"][v] = data["data"] +"/"+ file_name
				print("Found icon file: " ,data["icon"][v])
			elif file_name.ends_with(".txt.des") :
				var v = file_name.replace(".txt.des","")
				data["des"][v] = data["data"] +"/"+ file_name
				print("Found descripsi file: " ,data["des"][v])
			elif file_name.ends_with(".webp.background") :
				var v = file_name.replace(".webp.background","")
				data["background"][v] = data["data"] +"/"+ file_name
				print("Found background file: " ,data["background"][v])
			file_name = dir.get_next()
	f.store_var(data)
	f.close()
	emit_signal("buka_gui",data)
