extends WindowDialog

func _ready():
	$OptionButton.add_item("window",0)
	$OptionButton.add_item("linux",1)
	$OptionButton.add_item("mac",2)	
	$OptionButton.select(0)
	$Button.connect("pressed",self,"_on_Popup_confirmed")


func _on_Popup_confirmed():
	match $OptionButton.selected :
		0 :
			OS.shell_open("https://rifqideveloper.github.io/code-art-Launcher-updater/codeart.exe")
		1 :
			OS.shell_open("https://rifqideveloper.github.io/code-art-Launcher-updater/codeart.x86_64")
		2 :
			OS.shell_open("https://rifqideveloper.github.io/code-art-Launcher-updater/codeart.zip")
	

