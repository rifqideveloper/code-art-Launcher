extends Node


func _ready():
	var f : File = File.new()
	f.open("./website/Launcher/x86_64.sha",File.WRITE)
	f.store_string(f.get_sha256("./website/Launcher/linux/codeartLauncher.x86_64"))
	f.flush()
	f.open("./website/Launcher/exe.sha",File.WRITE)
	f.store_string(f.get_sha256("./website/Launcher/window/codeartLauncher.exe"))	
	f.flush()
	f.open("./website/Launcher/zip.sha",File.WRITE)
	f.store_string(f.get_sha256("./website/Launcher/mac/codeartLauncher.zip"))	
	f.close()
	get_tree().quit(0)
