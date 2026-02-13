extends CanvasLayer

var final_count : int = 0

@onready var to_stage_2_button : Button = %to_stage_2_button
@onready var to_stage_3_button : Button = %to_stage_3_button
@onready var to_stage_4_button : Button = %to_stage_4_button

@onready var fake_button_1: Button = %fake_button_1
@onready var fake_button_2: Button = %fake_button_2
@onready var fake_button_3: Button = %fake_button_3

@onready var stage_1 : VBoxContainer = %stage_1
@onready var stage_2 : VBoxContainer = %stage_2
@onready var stage_3 : VBoxContainer = %stage_3
@onready var stage_4 : VBoxContainer = %stage_4
@onready var identification_player: AnimationPlayer = %identification_player
@onready var cat_player: AnimationPlayer = %cat_player

@onready var final_button: Button = %final_button
@onready var final_button_2: Button = %final_button2
@onready var final_button_3: Button = %final_button3
@onready var final_button_4: Button = %final_button4
@onready var final_button_5: Button = %final_button5

@onready var hearts_particles: CPUParticles2D = %hearts_particles
@onready var bemeawbe_label: Label = %bemeawbe_label

@onready var ok_sfx: AudioStreamPlayer = %ok_sfx
@onready var no_sfx: AudioStreamPlayer = %no_sfx
@onready var creep: AudioStreamPlayer = %creep






func _ready() -> void:
	stage_1.modulate.a = 1
	stage_2.modulate.a = 0
	stage_3.modulate.a = 0
	identification_player.play("RESET")
	cat_player.play("RESET")
	
	to_stage_3_button.visible = false
	to_stage_4_button.visible = false
	
	fake_button_2.visible = false
	fake_button_3.visible = false
	
	final_button.visible = false
	final_button_2.visible = false
	final_button_3.visible = false
	final_button_4.visible = false
	final_button_5.visible = false
	

func animate_button(button : Button) -> void:
	var tween_color = create_tween()
	var tween_scale = create_tween()
	tween_color.tween_property(button,"self_modulate",Color(1,1,1,1),0.2).from(Color(2,2,2,1))
	tween_scale.tween_property(button,"scale",Vector2(1,1),0.2).from(Vector2(1.2,1.2))
	
func animate_stage_trans(stage_current, stage_next) -> void:
	var tween = create_tween()
	tween.tween_property(stage_current,"modulate:a",0,0.2).set_delay(0.2)
	tween.tween_property(stage_next,"modulate:a",1,0.2)



func _on_to_stage_2_button_pressed() -> void:
	ok_sfx.play()
	animate_button(to_stage_2_button)
	animate_stage_trans(stage_1,stage_2)
	to_stage_3_button.visible = true
	fake_button_2.visible = true
	await get_tree().create_timer(2.0).timeout
	identification_player.play("identification")


func _on_to_stage_3_button_pressed() -> void:
	ok_sfx.play()
	animate_button(to_stage_3_button)
	animate_stage_trans(stage_2,stage_3)
	to_stage_4_button.visible = true
	fake_button_3.visible = true
	await get_tree().create_timer(1.0).timeout
	cat_player.play("cat_appear")

func _on_to_stage_4_button_pressed() -> void:
	ok_sfx.play()
	animate_button(to_stage_4_button)
	animate_stage_trans(stage_3,stage_4)
	final_button.visible = true
	final_button_2.visible = true
	final_button_3.visible = true
	final_button_4.visible = true
	final_button_5.visible = true
	
	to_stage_2_button.visible = false
	to_stage_3_button.visible = false
	#to_stage_4_button.visible = false


func _on_fake_button_1_pressed() -> void:
	no_sfx.play()
	fake_button_1.position = Vector2(randi_range(fake_button_1.position.x-300,fake_button_1.position.x+300),
	randi_range(fake_button_1.position.y-300,fake_button_1.position.y+300))

func _on_fake_button_2_pressed() -> void:
	no_sfx.play()
	fake_button_2.position = Vector2(randi_range(fake_button_2.position.x-300,fake_button_2.position.x+300),
	randi_range(fake_button_2.position.y-300,fake_button_2.position.y+300))

func _on_fake_button_3_pressed() -> void:
	no_sfx.play()
	fake_button_3.position = Vector2(randi_range(fake_button_3.position.x-300,fake_button_3.position.x+300),
	randi_range(fake_button_3.position.y-300,fake_button_3.position.y+300))


func _on_final_button_pressed() -> void:
	ok_sfx.play()
	animate_button(final_button)
	var tween = create_tween()
	tween.tween_property(final_button,"modulate:a",0,0.2)
	final_button.disabled = true
	final_count += 1
	check_for_final_screen()


func _on_final_button_2_pressed() -> void:
	ok_sfx.play()
	animate_button(final_button_2)
	var tween = create_tween()
	tween.tween_property(final_button_2,"modulate:a",0,0.2)
	final_button_2.disabled = true
	final_count += 1
	
	check_for_final_screen()


func _on_final_button_3_pressed() -> void:
	ok_sfx.play()
	animate_button(final_button_3)
	var tween = create_tween()
	tween.tween_property(final_button_3,"modulate:a",0,0.2)
	final_button_3.disabled = true
	final_count += 1
	check_for_final_screen()


func _on_final_button_4_pressed() -> void:
	ok_sfx.play()
	animate_button(final_button_4)
	var tween = create_tween()
	tween.tween_property(final_button_4,"modulate:a",0,0.2)
	final_button_4.disabled = true
	final_count += 1
	check_for_final_screen()


func _on_final_button_5_pressed() -> void:
	ok_sfx.play()
	animate_button(final_button_5)
	var tween = create_tween()
	tween.tween_property(final_button_5,"modulate:a",0,0.2)
	final_button_5.disabled = true
	final_count += 1
	check_for_final_screen()

func check_for_final_screen() -> void:
	if final_count >=5:
		hearts_particles.emitting = true
		bemeawbe_label.visible = true
		creep.play()
