extends Node2D

var firstText = [
	[
		{"name": "Cecilia", "text": "Hej!"},
		{"name": "Daniel", "text": "Hej hej"},
		{"name": "Cecilia", "text": "Hur går det?"},
		{"name": "Daniel", "text": "Bra!"},
		{"name": "Cecilia", "text": "Vill du ha snacks?"},
		{"name": "Daniel", "text": "Ja tack."},
		{"name": "Narrator", 
			"text": "Ge Daniel snacks?", 
			"answer": true,
			"yes": "Ja",
			"no": "nej"
		},
	]	
]

var giveSnacks = [
	[
		{"name": "Daniel", "text": "Tack."},
		{"name": "Cecilia", "text": "Ingen fara."}
	],
	[
		{"name": "Narrator", "text": "Daniel ser glad ut."}
	]
]

var noSnacks = [
	[
		{"name": "Daniel", "text": "Nähä."},
		{"name": "Cecilia", "text": "Jag hade inga snacks."}
	],
	[
		{"name": "Narrator", "text": "Daniel ser besviken ut."}
	]
]

var currentText = firstText
var text_number = 0

func yes():
	if currentText == firstText:
		currentText = giveSnacks
	create_dialog()
	

func no():
	if currentText == firstText:
		currentText = noSnacks
	create_dialog()

func create_dialog():
	var dialog = load("res://Dialog/DialogSystem.tscn").instance()
	$DialogCanvas.add_child(dialog)
	dialog.start(currentText[text_number], self)
	if text_number < currentText.size()-1:
			text_number += 1
			
func start_dialog():
	create_dialog()
