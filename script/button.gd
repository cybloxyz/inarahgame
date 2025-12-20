extends Button


func _on_btn_kirim_pressed():
	var pesan_user = $LayarAkhir/VBoxContainer/TextEdit.text
	
	if pesan_user.strip_edges() == "":
		# Jika pesan kosong, jangan kirim dulu
		return
		
	var email_tujuan = "nafisanailalh7@gmail.com"
	var subjek = "Balasan dari Player Game".uri_encode()
	var isi_body = pesan_user.uri_encode()
	
	# Membuka aplikasi email default
	var mailto_link = "mailto:%s?subject=%s&body=%s" % [email_tujuan, subjek, isi_body]
	OS.shell_open(mailto_link)
