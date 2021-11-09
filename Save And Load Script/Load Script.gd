const SAVEDIR = "user://saves/"

var savePath = SAVEDIR + "save.dat" 

func loadPlayerData():
	var file = File.new()
	if file.file_exists(savePath):
		var error = file.open(savePath, File.READ)
		if error == OK:
			var lastHealth = file.get_var()
			PlayerStats.health = lastHealth
			file.close()