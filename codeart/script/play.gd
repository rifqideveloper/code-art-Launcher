extends Button

enum _state {
	siap
	belum_di_download
	belum_di_update
	looding
	update
	error
}

export (_state) var state : int = _state.siap

func _ready():
	pass

func _physics_process(delta) -> void:
	if state == _state.siap :
		if text != "_mainkan" :
			text = "_mainkan"
	elif state == _state.belum_di_download :
		if text != "_download_mainkan" :
			text = "_mainkan"
	elif state == _state.belum_di_update :
		if text != "_update_mainkan" :
			text = "_update_mainkan"
	elif state == _state.looding :
		if text != "_looding" :
			text = "_looding"
	elif state == _state.update :
		if text != "_update" :
			text = "_update"
	elif state == _state.error :
		if text != "_error" :
			text = "_error"

func _update() -> void :
	state = _state.update

func _on_play_pressed():
	if state == _state.belum_di_download or state == _state.belum_di_update:
		 _update()
	state = _state.looding
	if File.new().file_exists($"../../..".link):
		var v : Node = load("res://codeart/scene/game.tscn").instance()
		v.link = $"../../..".link
		add_child(v)
	else :
		state = _state.error
	
