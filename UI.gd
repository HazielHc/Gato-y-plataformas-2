extends CanvasLayer

@onready var coins_label = $CoinsCollectedText
var coins: int = 0

func _ready():
	
	var coin_list = get_tree().get_nodes_in_group("moneda")
	print("HUD: monedas en grupo 'moneda':", coin_list.size())
	$CoinsCollectedText.text = str(coins)
	for coin in coin_list:
		if coin and coin.has_signal("coinCollected"):
			coin.connect("coinCollected", Callable(self, "handleCoinCollected"))
		else:
			print("HUD: moneda sin señal 'coinCollected' ->", coin)

func handleCoinCollected():
	coins += 100  # Ahora cada moneda suma 100
	coins_label.text = str(coins)
	print("HUD: Coin Collected ->", coins)
 
