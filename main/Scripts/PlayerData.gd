extends Node

class_name PlayerData

var player_money: int
var player_reputation: int #for event spawning if good or bad %

var player_skillpoints: int

var player_level: int
#Skills
var skills = {
	"strength": Skill.new(),
	"endurance": Skill.new(),
	"metabolism": Skill.new(),
	"agility": Skill.new(),
	"luck": Skill.new(),
	"barter": Skill.new(),
}

func set_starter_player_data():
	#basic stats set
	player_money = 0
	player_reputation = 0
	player_skillpoints = 1
	player_level = 0
	#skills set
	for skill in skills.values():
		skill.level = 1
		skill.exp = 0
