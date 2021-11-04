extends Area2D

signal changeLevel(levelName)

export (String) var levelName = "Level #"

var levelParameters = {
    "health" : 0
}

func _on_Portal_body_entered(body: Node) -> void:
    if "Player" in body.name:
        emit_signal("changeLevel", levelName)

#Signal 'body_entered' needs to be connected

func setNewHealth(newHealth : int):
    PlayerStats.health = newHealth

func loadLevelParameters(newLevelParameters: Dictionary):
    levelParameters = newLevelParameters
    setNewHealth(levelParameters.health)