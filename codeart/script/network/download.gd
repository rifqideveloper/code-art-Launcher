extends Node2D
signal download(nama_file_tujuan,link)
onready var _request : Node = $HTTPRequest
var app_link_ : Dictionary = {
	"free person shooter":"https://rifqideveloper.github.io/download.github.io/Free%20Person%20shooter.pck"
}
var download_mulai : bool = false

func _ready():
	_request.connect("request_completed", self, "_on_request_completed")
	connect("download",self,"_download_file")
	
func _download_file(nama_file_tujuan:String,link:String) -> void :
	#_request.connect("request_completed", self, "_on_request_completed")
	$Label.text = "Doing request..."
	_request.set_download_file(nama_file_tujuan)
	_request.request(link)
	download_mulai = true
	
func _update() -> void :
	pass

func _on_request_completed(result, response_code, headers, body):
	download_mulai = false	
	$Label.text = "finist..." + str(_request.get_body_size())
	print("Request completed ", result, ", ", response_code)

func _process(delta):
	if download_mulai :
		var arr : float = float($HTTPRequest.get_downloaded_bytes())/1024
		var total : float = float($HTTPRequest.get_body_size())/1024
		$Label.text = "downloading..." + str(arr)+"kb /" + str(total) + "kb"
