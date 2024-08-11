class_name HandlerPotato
extends Node
## Manages potatoes and signals


## Singleton reference
static var ref : HandlerPotato

## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()
	
	
## Emitted when potato has been created	
signal potato_created(qunatity : int)


## Emitted when potato has been consumed
signal potato_consumed(quantity : int)
	

	
## Return current amount of potato available
func potato() -> int:
	return Game.ref.data.potato
	




## Create a specific amount of potato
func create_potato(quantity : int) -> void:
	Game.ref.data.potato += quantity
	potato_created.emit(quantity)
	
	
## Consume a specific amount of potatoes  		XXX
func consume_potato(quantity :int) -> Error:
	if quantity > Game.ref.data.potato:
		return Error.FAILED
		
		
		
	Game.ref.data.potato -= quantity
	potato_consumed.emit(quantity)
	
	return Error.OK
	
## Trigger by the clicker, create potato
func trigger_clicker() -> void:
	
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level
	
	create_potato(quantity)



