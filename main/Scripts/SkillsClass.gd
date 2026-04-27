class_name Skill
#USED IN PLAYERDATA skills of the player is stored as a dictionary - 
var level: int = 1
var exp: int = 0

#add exp and check if next level is achieved
#to be used at runtime in raid etc
func add_exp(amount: int):
	exp += amount
	var needed_exp: int = int(level * 11)
	if exp >= needed_exp:
		exp -= needed_exp
		level += 1
		
