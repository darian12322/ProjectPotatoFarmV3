class_name PotatoFarm
extends Control
## Main node and a clicker to create Potatoes

## Reference to the label displaying the current amount of potatoes
@export var label : RichTextLabel

## Connecting signals
func _ready() -> void:
	
	if HandlerPotato.ref:
		update_label_text()
		HandlerPotato.ref.potato_created.connect(update_label_text)
		HandlerPotato.ref.potato_consumed.connect(update_label_text)
	else:
		print("Not initializated")



## Create 1 Potato / click
func create_potato() -> void:
	HandlerPotato.ref.trigger_clicker()
	
## Update the text(label) to the current amount of Potatoes
func update_label_text(_quantity : int = -1) -> void:
	label.text = "[font=LemonShake.otf][color=white]Potatoes : [/color]%s" %HandlerPotato.ref.potato()

## Triggered when the create_potato button is pressed
func _on_button_pressed() -> void:
	create_potato()
	
