function save_high_score(high_score) {
    ini_open("score.ini")
    ini_write_real("score", "high_score", high_score)
    ini_close()
}

function load_high_score() {
    ini_open("score.ini")
	loaded_score = ini_read_real("score", "high_score", 0)
    ini_close()
    return loaded_score
}