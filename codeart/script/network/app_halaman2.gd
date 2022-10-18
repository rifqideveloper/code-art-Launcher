extends VBoxContainer

var icon : String
var backgroun : String
var link_sha256 : String = "https://rifqideveloper.github.io/free-person-shooter/index.sha256"
var link : String = "https://rifqideveloper.github.io/free-person-shooter/index.pck"
var user_date : String = "user://game"
var nama : String = "free person shooter"


enum states {
	update
	download
	cek_update
	play
	play_update
	looding
}

export(states) var state : int = states.play_update

func _ready() -> void :
	$background/nama.text = nama
	$background/download2.app_link_[0] = user_date
	$background/download2.app_link_[1] = nama
	$background/download2.app_link_[2] = link
	state = states.cek_update 
	$background/download2._checksum(user_date + "/" + nama +".pck",link_sha256) 

	if !icon.empty() :
		pass
	if !backgroun.empty():
		pass
	
func _chechsum_selesai(hasil:bool) -> void :
	if hasil : 
		_update_selesai(state == states.play_update)
	else :
		state = states.play_update

func _physics_process(delta) -> void:
	match state :
		states.update :
			if $background/play.text != "_update" :
				$background/play.text = "_update"
		states.play_update :
			if $background/play.text != "_play_update" :
				$background/play.text = "_play_update"
		states.play :
			if $background/play.text != "_play" :
				$background/play.text = "_play"

func _update_selesai(play:bool) -> void :
	if play :
		state = states.looding
		$background/play.text = "_looding"
		var v : Node = load("res://codeart/scene/game.tscn").instance()
		v.link = user_date + "/" + nama +".pck"
		add_child(v)
	else :
		state = states.play		

func _on_play_pressed():
	print(state)
	match state :
		states.play_update , states.play:
			print("_on_play_pressed")
			#cek update
			if !nama.empty() :
				state = states.play_update
				$background/download2._checksum(user_date + "/" + nama +".pck",link_sha256) 
				
				#$background/download2.emit_signal("update",true)
export (NodePath) var kembali : NodePath
func _on_kembali_pressed():
	get_node(kembali).visible = true
	visible = false
	
