extends CanvasLayer
var time = 0

func _ready():
	$Label.text = String(time)




func _on_Timer_timeout():
	time=time+1
	$Label.text = String(time)
	$Timer.start()
