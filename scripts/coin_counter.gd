extends Node

var coins: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func add_coin():
	coins += 1
	update_coin_display()

func get_coins():
	return coins

func clear_coins():
	coins = 0
	update_coin_display()
	
func update_coin_display():
	get_tree().get_root().get_node("Level1").get_node("HUD").get_node("Score").text = "Score: " + str(coins)
