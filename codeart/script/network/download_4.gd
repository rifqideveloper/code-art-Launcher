extends Node
enum states {
	ceksum
	siap
	update
	donwload_sha
	tunggu_donwload_sha
	donwload_pck
	tunggu_donwload_pck
	Null
	error
	offline
}
export(NodePath) var tombol : NodePath
export(NodePath) var txt : NodePath

var sha256 : String = "https://rifqideveloper.github.io/free-person-shooter/index.sha256"
var pck : String = "https://rifqideveloper.github.io/free-person-shooter/index.pck"
var user_date : String = "user://game"
var nama : String = "free person shooter"
var sha_terdownload : bool = false
var pck_terdownload : bool = false
#var update_dimulai : bool = false
var mulai : bool = false
#var download : bool = false
export (states) var state : int = states.ceksum

func _ready() -> void:
	$sha.connect("request_completed",self,"_on_sha_completed")
	$pck.connect("request_completed",self,"_on_pck_completed")
	get_node(tombol).connect("pressed",self,"_klik")
	
func _process(delta) -> void:
	match state :
		states.offline :
			get_node(txt).text = "offline"
		states.donwload_sha :
			get_node(txt).text = "cek update"
			if File.new().file_exists(user_date + "/" + nama + ".pck") :
				sha_terdownload = false
				$sha.set_download_file(user_date + "/" + nama + ".sha256")
				if $sha.request(sha256) == OK :
					print("ok")
				else :
					print("error")					
				state = states.tunggu_donwload_sha
			else :
				get_node(txt).text = "butuh update"
				state = states.update
				
		states.tunggu_donwload_sha :
			if sha_terdownload :
				state = states.ceksum
			
		states.ceksum :
			if _cek_sum() :
				state = states.siap
				if mulai :
					get_node(txt).text = "loooding ... 0%"
				else :
					get_node(txt).text = "downloading ... " + str(float($pck.get_downloaded_bytes())/1024)+"kb /" + str(float($pck.get_body_size())/1024) + "kb"
			else :
				get_node(txt).text = "butuh di update"
				state = states.update

		states.siap :
			if mulai :
				get_node(txt).text = "loooding ... 50%"
				if ProjectSettings.load_resource_pack(user_date + "/" + nama + ".pck" ,true) :
					print("pck ditemukan")
					#dir_contents("res://")
					get_node(txt).text = "loooding ...100%"
					get_tree().change_scene_to(ResourceLoader.load("res://scene//main.tscn"))
				else :
					state = states.error
					print("pck tidak ditemukan")
		states.update :
			if mulai :
				$pck.set_download_file(user_date + "/" + nama + ".pck")
				$pck.request(pck)
				$sha.set_download_file(user_date + "/" + nama + ".sha256")
				$sha.request(sha256)
				state = states.tunggu_donwload_pck
				
		states.tunggu_donwload_pck :
			if sha_terdownload and pck_terdownload :
				state = states.ceksum
				sha_terdownload = false
				pck_terdownload = false
			else :
				get_node(txt).text = "downloading ... " + str(float($pck.get_downloaded_bytes())/1024)+"kb /" + str(float($pck.get_body_size())/1024) + "kb"
				
			#var success = ProjectSettings.load_resource_pack(user_date + "/" + nama +".pck")
			#if success :
			#	print("siap mulai game")
				
			#	state = 7
func _klik() -> void :
	if state == states.siap or states.update == state:
		mulai = true
		
		
func _on_sha_completed(result, response_code, headers, body) -> void:
	sha_terdownload = true
	print("sha terdownload")
	
func _on_pck_completed(result, response_code, headers, body) -> void:
	pck_terdownload = true
	print("pck terdownload")

func _cek_sum() -> bool :
	if File.new().file_exists(user_date + "/" + nama +".pck") :
		print("file pck ada")
		if File.new().file_exists(user_date + "/" + nama + ".sha256") :
			print("file sha ada")
			var f_1 : File = File.new()
			var f_2 : File = File.new()
			if f_2.open(user_date + "/" + nama + ".sha256",File.READ) == OK :
				if f_1.get_sha256(user_date + "/" + nama +".pck") == f_2.get_as_text() :
					print("file sha benar")
					f_1.close()
					f_2.close()
					return true
			f_1.close()
			f_2.close()
	return false
	
