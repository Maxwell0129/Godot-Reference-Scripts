extends Node

onready var currentLevel = "Level ##" 

func _ready() -> void:
    currentLevel.connect("changeLevel", self, "loadLevel")

func loadLevel(levelName : String):
    var nextLevel = null
    var nextLevelNumber: String

    nextLevel = load("res://Levels/" + nextLevelNumber + ".tscn").instance()
    add_child(nextLevel)
    nextLevel.connect("changeLevel", self, "loadLevel")
    currentLevel.queue_free()
    currentLevel = nextLevel
    loadDataBetweenLevels(currentLevel, nextLevel)

    match levelName:
        "Level #1":
            nextLevelNumber = "Level #2"
        "Level #2":
            nextLevelNumber = "Level #3"
        "Level #3":
            nextLevelNumber = "Level #4"
        "Level #4":
            nextLevelNumber = "Level #5"
        _: #Invalid Level Placeholder
            return
    
func loadDataBetweenLevels(lastLevel, newLevel):
    newLevel.loadLevelParameters(lastLevel.levelParameters)
