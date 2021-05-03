extends Control

var text
var currentLine = 0
var textRun = false
var par
var answer = false

func start(new_text, parent):
	par = parent
	text = new_text
	showText()
		
func bounce_anim():
	$AnimationPlayer.play("bounce")

func showText():
	
	$"NameBox/Label".text = text[currentLine]["name"]
	$"DialogBox/Label".text = text[currentLine]["text"]
	$AnimationPlayer.play("show_text")
	textRun = true
	
	if text[currentLine].has("answer"):
		$Buttons.visible = true
		$"Buttons/Yes".text = text[currentLine]["yes"]
		$"Buttons/No".text = text[currentLine]["no"]
		answer = true
	else:
		$Buttons.visible = false
		answer = false
	
	if currentLine < text.size():
		currentLine += 1

	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("mouse_left") and !answer:
		if textRun == false:
			if currentLine < text.size():
				$AnimationPlayer.stop()
				$"Continue/Label".rect_scale = Vector2(1,1)
				showText()	
			else:
				queue_free()
		else:
			$AnimationPlayer.stop()
			$"DialogBox/Label".percent_visible = 1
			textRun = false
			bounce_anim()
			
func speedUpText():
	textRun = false


func _on_Yes_pressed():
	answer = false
	par.text_number = 0
	par.yes()
	queue_free()

func _on_No_pressed():
	answer = false
	par.text_number = 0
	par.no()
	queue_free()
