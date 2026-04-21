extends Node

var current_track: AudioStreamPlayer

# Song Dictionary
var songs := {
	"menu": preload("res://songs/AmbientacionABI.wav")	
}

# On ready slop
func _ready() -> void:
	current_track = AudioStreamPlayer.new()
	add_child(current_track)
	current_track.autoplay = false

# Play music
func play_music(nam: String):
	if not songs.has(nam):
		push_error("Error reproduccion!" % nam)
		return
	
	var stream = songs[nam]
	
	current_track.stop()
	current_track.stream = stream
	current_track.play()

# Play music fading in slop
func play_music_fade(nam: String, fade_time := 1.0):
	var tween = get_tree().create_tween()
	var stream = songs[nam]

	# fade out slop
	tween.tween_property(current_track, "volume_db", -40, fade_time)

	tween.finished.connect(func():
		current_track.stop()
		current_track.stream = stream
		current_track.play()

		# fade in
		var tween2 = get_tree().create_tween()
		tween2.tween_property(current_track, "volume_db", -3, fade_time))

# Esto es solo para guiarnos XD asi se llama la clase
# VOLUME: 	MusicManager.current_track.volume_db = -6
# PLAY: 	MusicManager.play_music("menu")

# Stop music duh
func stop_music():
	current_track.stop()
