extends Node

const SAVEDIR = "user://saves/"

var savePath = SAVEDIR + "save.dat" 

func savePlayerData():
	var lastHealth = PlayerStats.health
	var file = File.new()
	var error = file.open(savePath, File.WRITE)
	if error == OK:
		file.store_var(lastHealth)
		print(lastHealth)
		file.close()
		