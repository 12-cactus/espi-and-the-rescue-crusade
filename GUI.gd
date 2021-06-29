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

var items: Array = [
	"Sandwich",
	"Wine",
	"Bike",
	"Passport",
	"Nunchaku",
	"Mac",
	"Book",
	"Vodka",
	"Michis"
]

var cactus_to_save: Dictionary = {
	"Markis": false,
	"Agus": false,
	"Dami": false,
	"Saba": false,
	"Dan": false,
	"Alan": false,
	"Juan": false,
	"Ana": false,
	"Maru": false
}

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

func _are_all_cactus_saved() -> bool:
	for rescued in cactus_to_save.values():
		if not rescued:
			return false
	return true

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

func on_cactus_found(_faceset: String, item: String):
	get_node("ItemsToCollect/" + item).visible = true

func on_cactus_saved(faceset: String, item: String):
	for cactus in cactus_to_save.keys():
		if faceset.match("*" + cactus + "*"):
			cactus_to_save[cactus] = true
			CactusToSave.get_node(cactus + "/Center/WhiteBorder").visible = false
			CactusToSave.get_node(cactus + "/Center/GreenBorder").visible = true
			CactusToSave.get_node(cactus + "/Center/Face").texture = load(faceset)
			get_node("ItemsToCollect/" + item).visible = false
	
	# FIXME add some timer before this
	if _are_all_cactus_saved():
		_all_saved()

func on_item_collected(item_name):
	for item in items:
		if item_name.match("*" + item + "*"):
			_increase_amount_to(item, 1)

func on_items_consumed(item_name, amount):
	for item in items:
		if item_name.match("*" + item + "*"):
			_increase_amount_to(item, amount * -1)

func _increase_amount_to(node_name, inc):
	var label: Label = ItemsToCollect.get_node(node_name + "/Label")
	var amount: int = max(int(label.text) + inc, 0)
	label.text = str(amount)
