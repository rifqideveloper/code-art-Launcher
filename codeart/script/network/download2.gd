extends Node2D

onready var _request : Node = $HTTPRequest
var app_link_ : PoolStringArray = [
	"user://game","free person shooter","https://rifqideveloper.github.io/code-art-Launcher/data/Free%20Person%20shooter.pck"
]
var download_mulai : bool = false

func _ready():
	_request.connect("request_completed", self, "_on_request_completed")
	_download_file(app_link_[0]+"/"+app_link_[1]+".pck",app_link_[2])
	
func _on_request_completed(result, response_code, headers, body):
	download_mulai = false	
	$Label.text = str(float($HTTPRequest.get_body_size())/1024) + "kb"
	print("Request completed ", result, ", ", response_code)
	
func _download_file(nama_file_tujuan:String,link:String) -> void :
	#_request.connect("request_completed", self, "_on_request_completed")
	$Label.text = "Doing request..."
	_request.set_download_file(nama_file_tujuan)
	_request.request(link)
	download_mulai = true
	
func _process(delta):
	if download_mulai :
		var arr : float = float($HTTPRequest.get_downloaded_bytes())/1024
		var total : float = float($HTTPRequest.get_body_size())/1024
		$Label.text = "downloading..." + str(arr)+"kb /" + str(total) + "kb"
