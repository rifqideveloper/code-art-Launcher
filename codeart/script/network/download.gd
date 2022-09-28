extends Node2D
signal download(nama_file_tujuan,link)
onready var _request : Node = $HTTPRequest

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

func _on_request_completed(result, response_code, headers, body):
	download_mulai = false	
	$Label.text = "finist..." + str(_request.get_body_size())
	print("Request completed ", result, ", ", response_code)

func _process(delta):
	if download_mulai :
		$Label.text = "downloading..." + str(_request.get_downloaded_bytes())   
		if _request.get_body_size() != -1 :
			$Label.text += "/" + str(_request.get_body_size())
