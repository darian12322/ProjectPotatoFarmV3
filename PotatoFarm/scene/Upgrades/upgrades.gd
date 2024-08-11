class_name Upgrades
extends Control
## Displaying an upgrade

## Reference to the title
@export var label_text : Label
## Reference to the description
@export var label_description : RichTextLabel
## Reference to the button
@export var button : Button	


## Upgrade to display
var upgrade : Upgrade
	


func _ready() -> void:
	upgrade = UP01ClickerUpgrade.new()
	
	update_label_title()
	update_label_description()
	update_button()
	
	HandlerPotato.ref.potato_created.connect(update_button)
	HandlerPotato.ref.potato_consumed.connect(update_button)

	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)
	

## Update the title of the upgrade
func update_label_title() -> void:
	var text : String = upgrade.title + " (%s)" %upgrade.level
	label_text.text = text
	
## Update the description of the upgrade
func update_label_description() -> void:
	label_description.text = upgrade.description()
	
## Update the button availability
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	button.disabled = true
	



func _on_purchase_button_pressed():
	upgrade.level_up()

