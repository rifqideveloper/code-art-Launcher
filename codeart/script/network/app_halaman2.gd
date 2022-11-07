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
	pass
	
func _chechsum_selesai(hasil:bool) -> void :
	if hasil : 
		_update_selesai(true)
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
		state = states.play_update		

func _on_play_pressed():
	#$background/download3._jalankan($background/download3.state.download_update)
	pass	
export (NodePath) var kembali : NodePath
func _on_kembali_pressed():
	get_node(kembali).visible = true
	visible = false

func _on_app_halaman2_visibility_changed():
	if visible :
		$background/download_4.mulai = false	
		$background/download_4.user_date = user_date
		$background/download_4.nama = nama
		$background/download_4.sha256 = link_sha256
		$background/download_4.pck = link
		$background/download_4.state = $background/download_4.states.donwload_sha
