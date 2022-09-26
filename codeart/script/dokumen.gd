extends Node
signal buka_gui(data)
var data : Dictionary = {
	"ver" : "0.2",
	"data" : "user://game",
	"link":{
		
	}
}

const dat : String = "user://data_code_art.dat"
func _ready():
	
	var f : File = File.new()
	if OK == f.open(dat,File.READ_WRITE):
		var v = f.get_var()
		if data["ver"] == v["ver"] :
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
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			elif filename.find_last(".pck"):
				var v = file_name.replace(".pck","")
				data["link"][v] = data["data"] +"//"+ file_name
				print("Found pck file: " ,data["link"][v])
				
			file_name = dir.get_next()
	f.store_var(data)
	f.close()
	emit_signal("buka_gui",data)
