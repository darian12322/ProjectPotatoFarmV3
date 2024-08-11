class_name UP01ClickerUpgrade
extends Upgrade
## Upgrade 01- Start passive generator

func _enter_tree() -> void:
	pass


## Load data
func _init() -> void:
	level = Game.ref.data.up_01_level
	title = "Clicker Upgrade"
	base_cost = 5
	calculate_cost()



## Returns description, effect and cost
func description() -> String:
	var _description : String = "Increase the potatoes on click  "
	_description += "\nEffects : +1 Potato / level"
	_description += "\nCost : %s" %cost
	
	return _description
	
## Returns the current cost based on the level
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, level))
	

## Retruns if player can buy the upgrade or not
func can_afford() -> bool:
	if HandlerPotato.ref.potato() >= cost:
		return true
		
	return false


## Consumes potatoes to level up 			
func level_up() -> void:
	var error : Error = HandlerPotato.ref.consume_potato(cost)
	if not error:
		level += 1
		Game.ref.data.up_01_level = level
		
		calculate_cost()
				
		leveled_up.emit()

