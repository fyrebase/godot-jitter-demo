extends KinematicBody2D

var speed: float = 250
var velocity: Vector2 = Vector2.ZERO
var direction: int = 1

func _ready() -> void:
  randomize()

  var screenSize = OS.get_screen_size()

  var startPositions: Array = [-100, screenSize.x + 100]
  var rand_index: int = randi() % startPositions.size()

  position = Vector2(startPositions[rand_index], rand_range(100.0, screenSize.y - 100))

  if position.x > screenSize.x:
    direction = -1
    $Sprite.flip_h = true

func _physics_process(delta: float) -> void:
  velocity = transform.x * direction * speed
  move_and_collide(velocity * delta)

func _on_VisibilityNotifier2D_screen_exited() -> void:
  queue_free()
