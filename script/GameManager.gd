extends Node

var total_items: int = 1 
var items_found: int = 0

func collect_item():
	items_found += 1
	print("Barang ketemu: ", items_found)
	
	var label= get_tree().get_first_node_in_group("ui_label")
	if label:
		label.text = str(items_found) + " / " + str(total_items)
	
	if items_found >= total_items:
		munculkan_notif_akhir()

func munculkan_notif_akhir():
	# Beri grup "final_panel" pada node PanelContainer tadi
	var layar = get_tree().get_first_node_in_group("final_ui")
	if layar:
		layar.visible = true
		get_tree().get_first_node_in_group("ui_controls").visible = false
		var text_edit = layar.find_child("TextEdit")
		if text_edit:
			text_edit.grab_focus()
		# Sembunyikan kontrol jalan agar tidak mengganggu ngetik
		
		
