extends "player.gd"


func kill_player():
	$Sprite2D.flip_v = true
	get_tree().get_root().get_node("Level1").get_node("HUD").get_node("GameOverMenu").get_node("Items").get_node("FinalScore").text = "Final score is: " + str(CoinCounter.get_coins())
	get_tree().get_root().get_node("Level1").get_node("HUD").get_node("GameOverMenu").visible = true
