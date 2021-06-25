extends CanvasLayer

onready var LifeBar = $LifeBar
onready var Start: TextureRect = $Start
onready var Win: TextureRect = $Win
onready var Intro: TextureRect = $Intro
onready var Restart: TextureRect = $Restart
onready var WindowFrame: TextureRect = $WindowFrame
onready var Dialog: Sprite = $Dialog
onready var Sound = load("res://entities/MusicPlayer.tscn")
onready var CactusToSave = $CactusToSave
onready var ItemsToCollect = $ItemsToCollect

var cactus_saved_amount = 0
var cactus_saved_needed = 4

func _ready():
	_set_all_invisible()
	Start.visible = true

func _on_World_start():
	show_intro()

func _on_World_intro():
	show()
	
func show_intro():
	_set_all_invisible()
	Intro.visible = true

func show():
	_set_all_invisible()
	LifeBar.visible = true
	WindowFrame.visible = true
	CactusToSave.visible = true
	ItemsToCollect.visible = true

func on_player_hit(damage):
	LifeBar.life -= damage

func on_player_dead():
	_set_all_invisible()
	Restart.visible = true

func _all_saved():
	_set_all_invisible()
	Win.visible = true

func _set_all_invisible():
	Start.visible = false
	Win.visible = false
	Intro.visible = false
	Restart.visible = false
	LifeBar.visible = false
	WindowFrame.visible = false
	Dialog.visible = false
	CactusToSave.visible = false
	ItemsToCollect.visible = false

func on_player_revive():
	show()

func on_show_dialog(faceset, text):
	Dialog.get_node("face").texture = faceset
	Dialog.get_node("text").set_text(text)
	Dialog.visible = true

func on_leave_dialog():
	Dialog.get_node("text").set_text("EMPTY")
	Dialog.visible = false

func on_cactus_saved(faceset):
	cactus_saved_amount += 1
	if faceset.match("*Markis*"):
		CactusToSave.get_node("Markis/TextureRect").texture = load(faceset)
	if faceset.match("*agus*"):
		CactusToSave.get_node("Agus/TextureRect").texture = load(faceset)
	if faceset.match("*dami*"):
		CactusToSave.get_node("Dami/TextureRect").texture = load(faceset)
	if faceset.match("*saba*"):
		CactusToSave.get_node("Saba/TextureRect").texture = load(faceset)		
	if cactus_saved_amount == cactus_saved_needed:
		_all_saved()

func on_item_collected(item_name):
	if item_name.match("*Sandwich*"):
		_increase_amount_to("Sandwiches", 1)
	if item_name.match("*Wine*"):
		_increase_amount_to("Wines", 1)
	if item_name.match("*Bike*"):
		_increase_amount_to("Bike", 1)
	if item_name.match("*Passport*"):
		_increase_amount_to("Passport", 1)

func on_items_consumed(item_name, amount):
	if item_name.match("*Sandwich*"):
		_increase_amount_to("Sandwiches", amount * -1)
	if item_name.match("*Wine*"):
		_increase_amount_to("Wines", amount * -1)

func _increase_amount_to(node_name, inc):
	var label: Label = ItemsToCollect.get_node(node_name + "/Label")
	var amount: int = int(label.text)
	label.text = str(amount + inc)
