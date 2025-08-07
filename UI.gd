extends CanvasLayer

var coins = 0

func _ready():
	
	
	var coinNode = get_tree().get_current_scene().find_node("coin2D", true, false)

	coinNode.connect("coinCollected", self, "handleCoinCollected")
	
	
	$CoinsCollectedText.text = str(coins)
	
func handleCoinCollected():
	print("coin collected")
	coins+=1
	$CoinsCollectedText.text = str(coins)
	
	
	
	
