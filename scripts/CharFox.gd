extends CharacterBody3D

var text_toggle: bool=false
var timeline: DialogicTimeline = DialogicTimeline.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var events: Array = """
	join fox 1
	fox (fox): Теперь я могу брать текст из кода!
	- Круто!
	fox (fox): Пока.
		
	""".split('\n')
	timeline.events= events
	timeline.events_processed=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	Dialogic.start(timeline)
