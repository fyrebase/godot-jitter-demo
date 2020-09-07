extends Node2D

var enemy: PackedScene = preload ("res://enemy.tscn")

onready var _timer: Timer = Timer.new()

func _ready() -> void:
  var _timerConnection = _timer.connect("timeout", self, "_onTimerTimeout")

  _timer.wait_time = 1.0
  _timer.one_shot = false
  _timer.autostart = true

  add_child(_timer)

  OS.window_fullscreen = true
  OS.window_size = OS.get_screen_size()
  OS.set_window_always_on_top(true)

func _onTimerTimeout() -> void:
  var e: Node = enemy.instance()

  add_child(e)
