extends Control

var link : String = ""
var nama : String = ""

func _ready():
	var f : File = File.new()
	print(link)
	
	if f.open("user://data_code_art.dat",File.READ) == OK :
		var v = f.get_var()
		
		var ff : File = File.new()
		if ff.open(v["des"][nama],File.READ) == OK :
			v = ff.get_as_text()
			$VBoxContainer/RichTextLabel.text = v
		ff.close()
		
	f.close()
	pass
