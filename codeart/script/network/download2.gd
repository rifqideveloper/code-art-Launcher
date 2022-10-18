extends Node2D

signal update(play)
signal update_selesai(play)
signal chechsum_selesai(hasil)
onready var _request : Node = $HTTPRequest
var app_link_ : PoolStringArray = [
	"user://game","free person shooter","https://rifqideveloper.github.io/code-art-Launcher/data/Free%20Person%20shooter.pck"
]
var download_mulai : bool = false
var _play : bool = false
var chechsum : String = ""
func _ready():
	connect("update",self,"_update")
	_request.connect("request_completed", self, "_on_request_completed")
	#_download_file(app_link_[0]+"/"+app_link_[1]+".pck",app_link_[2])
enum states {
	download
	tunggu
}
export(states) var state : int = states.tunggu
func _checksum(nama:String,link:String) -> void :
	var f : File = File.new()
	if f.file_exists(nama) :
		var sha_path : String = app_link_[0] + "/" + app_link_[1] + ".sha256"		
		
		chechsum = nama
		_download_file(sha_path,link,false)
		
	f.close()
	
	
func _update(play:bool) -> void :
	_play = play
	_download_file(app_link_[0]+"/"+app_link_[1]+".pck",app_link_[2],play)
	
	
func _on_request_completed(result, response_code, headers, body):
	download_mulai = false	
	$Label.text = str(float($HTTPRequest.get_body_size())/1024) + "kb"
	print("Request completed ", result, ", ", response_code)
	state = states.tunggu
	if !chechsum.empty() :
		var f : File = File.new()
		var sha_path : String = app_link_[0] + "/" + app_link_[1] + ".sha256"
		var sha : String = f.get_sha256(chechsum)
		var v : bool = false
		if f.open(sha_path,File.READ) == OK :
			var sha_download : String = f.get_as_text()	
			print("sha file ditemukan ",sha_path)
			print("sha ",sha)
			print("sha ",sha_download)
			#print("checksum ",sha ," ",sha_download ," " , sha == sha_download)
			v = sha == sha_download	
		if !v :
			$Label.text = "_butuh_update"
		emit_signal("chechsum_selesai",v)
		chechsum = ""
	else :
		emit_signal("update_selesai",_play)

func _download_file(nama_file_tujuan:String,link:String,play:bool) -> void :
	#_request.connect("request_completed", self, "_on_request_completed")
	$Label.text = "Doing request..."
	_play = play
	
	_request.set_download_file(nama_file_tujuan)
	_request.request(link)
	download_mulai = true
	state = states.download
	

func _process(delta):
	if download_mulai :
		var arr : float = float($HTTPRequest.get_downloaded_bytes())/1024
		var total : float = float($HTTPRequest.get_body_size())/1024
		if chechsum.empty() :
			$Label.text = "downloading..."  
		else :
			$Label.text = "_cek update"  			
		$Label.text += str(arr)+"kb /" + str(total) + "kb"
