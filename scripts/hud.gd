extends CanvasLayer


func _physics_process(delta: float) -> void:
	$fps.text= "FPS= " + str(Performance.get_monitor(Performance.TIME_FPS))
	$memory.text= "Memory= " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC)/1024/1024)) + "MB"
