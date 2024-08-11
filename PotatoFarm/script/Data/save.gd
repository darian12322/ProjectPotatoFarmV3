class_name SaveSystem
## Save data and load



## Define a path to save
const PATH : String = "user://save.tres"
## Load the game or not?
const SHOULD_LOAD : bool = true



## Func to save data
static func save_data() -> void:
	ResourceSaver.save(Game.ref.data, PATH)
	

## Func to load data
static func load_data() -> void:
	if not SHOULD_LOAD:
		return
		
	if ResourceLoader.exists(PATH):
		Game.ref.data = load(PATH)
