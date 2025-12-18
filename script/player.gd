extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0 # Kamu bisa ubah angka ini untuk tinggi lompatan

# Ambil gravitasi otomatis dari settingan Godot
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# 1. Efek Gravitasi (Jatuh)
	if not is_on_floor():
		velocity.y += gravity * delta

	# 2. Input Lompat
	# "ui_accept" biasanya otomatis terhubung ke spasi atau tombol HP yang kita buat nanti
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 3. Input Gerak Kiri-Kanan
	# Ini akan membaca input dari keyboard (panah) atau TouchScreenButton
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		# Opsional: Balikkan gambar sprite (Flip)
		$Sprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
