GDPC                                                                               <   res://.import/icon.png-61c9a1723ccd2d9cf1ecd4964450a216.stex�      �      &�y���ڞu;>��.p    res://codeartstudio/game.tscn   P      x       �~�p��u�8qꝵ�$   res://codeartstudio/game_opsi.tscn  �      �       sl�: r���Ya+�+   res://codeartstudio/icon.png�      �      G1?��z�c��vN��$   res://codeartstudio/icon.png.import �	      �      \����s�E�k�hWDJT    res://codeartstudio/main.tscn   P      G      1v�N��;zٙ/����   res://project.binary�$            C�Tb���a�F13        [gd_scene format=2]

[node name="game" type="Tabs"]
anchor_right = 1.0
anchor_bottom = 1.0
tab_close_display_policy = 2
        [gd_scene load_steps=2 format=2]

[ext_resource path="res://codeartstudio/icon.png" type="Texture" id=1]

[node name="Button" type="Button"]
margin_right = 12.0
margin_bottom = 20.0
text = "error"
icon = ExtResource( 1 )
flat = true
       GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-61c9a1723ccd2d9cf1ecd4964450a216.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://codeartstudio/icon.png"
dest_files=[ "res://.import/icon.png-61c9a1723ccd2d9cf1ecd4964450a216.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[gd_scene load_steps=3 format=2]

[sub_resource type="GDScript" id=3]
script/source = "extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = \"text\"

var game_dir : String = \"./\"
# Called when the node enters the scene tree for the first time.
func _ready():
	make_dir(\"game\")
	if File.new().file_exists(\"./data\") :
		var f : File= File.new()
		f.open(\"./data\",File.READ) 
		var v : Dictionary = f.get_var()
		game_dir = v.get(\"game_dir\")
	else :
		var f : File= File.new()
		f.open(\"./data\",File.WRITE_READ) 
		f.store_var({
			\"game_dir\":\"./\"
		})
	game_list()
	
func game_list() -> Array :
	var opsi : Node = preload(\"res://codeartstudio/game_opsi.tscn\").instance()
	var files : Array
	var x  : Directory = Directory.new()
	x.open(\"./game/\")
	x.list_dir_begin()
	var file = x.get_next()
	while file != \"\" :
		files.append(file)
		var v : Node = opsi.duplicate()
		v.text = file
		$TabContainer/beranda/pilihan_game.add_child(v)
		file = x.get_next()
	x.list_dir_end()
	return files
	
func make_dir (nama:String) :
	var f : Directory =Directory.new()
	f.open(game_dir)
	f.make_dir_recursive(nama)

"

[sub_resource type="GDScript" id=2]
script/source = "extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = \"text\"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_google_pressed():
	$\"../../../TabContainer\".visible = true
	$\"../..\".visible = false
"

[node name="main" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
script = SubResource( 3 )

[node name="TabContainer" type="TabContainer" parent="."]
visible = false
anchor_right = 1.0
anchor_bottom = 1.0
tab_align = 0

[node name="beranda" type="Tabs" parent="TabContainer"]
anchor_right = 1.0
anchor_bottom = 1.0
margin_left = 4.0
margin_top = 32.0
margin_right = -4.0
margin_bottom = -4.0
tab_align = 0

[node name="pilihan_game" type="GridContainer" parent="TabContainer/beranda"]
anchor_right = 1.0
anchor_bottom = 1.0

[node name="pengaturan" type="Tabs" parent="TabContainer"]
visible = false
margin_right = 40.0
margin_bottom = 24.0

[node name="CenterContainer" type="CenterContainer" parent="."]
anchor_right = 1.0
anchor_bottom = 1.0

[node name="VBoxContainer" type="VBoxContainer" parent="CenterContainer"]
margin_left = 471.0
margin_top = 281.0
margin_right = 552.0
margin_bottom = 319.0

[node name="Label" type="Label" parent="CenterContainer/VBoxContainer"]
margin_right = 81.0
margin_bottom = 14.0
text = "login dengan"

[node name="google" type="Button" parent="CenterContainer/VBoxContainer"]
margin_top = 18.0
margin_right = 81.0
margin_bottom = 38.0
text = "google"
script = SubResource( 2 )

[connection signal="pressed" from="CenterContainer/VBoxContainer/google" to="CenterContainer/VBoxContainer/google" method="_on_google_pressed"]
         �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         codeartstudio      application/run/main_scene(         res://codeartstudio/main.tscn      application/config/icon$         res://codeartstudio/icon.png+   gui/common/drop_mouse_on_gui_input_disabled         )   physics/common/enable_pause_aware_picking         %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment,      $   res://codeartstudio/default_env.tres        