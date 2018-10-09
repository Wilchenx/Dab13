/*
DabCoins credit card

not a vbucks ripoff i swear
*/
var/list/list_dab_cards = list()
/datum/credit_card
	//name = "credit card"
	var/owner = ""
	var/code = 1000 //1000-9999
	var/dabcoins = 0 //loaded by game
	New()
		..()
		list_dab_cards += src
	proc/Spend_DabCoins(var/amount)
		if(dabcoins >= amount)
			dabcoins -= amount
			Save()
			return 1
		else
			return 0
	proc/InitCard(var/key = "AlcaroIsAFrick")
		owner = key
		if(world.port in PORTS_NOT_ALLOWED)
			dabcoins = 50000 //lotsa starter money for tests.
		else
			var/savefile/F = new("data/dabcoins/[owner]Card.sav")
			ReadSaveRes(F)
	proc/Save()
		if(!(world.port in PORTS_NOT_ALLOWED))
			var/savefile/F = new("data/dabcoins/[owner]Card.sav")
			WriteSaveRes(F)
	proc/WriteSaveRes(savefile/F)
		F["dabcoins"] << dabcoins
	proc/ReadSaveRes(savefile/F)
		if(F["dabcoins"])
			F["dabcoins"] >> dabcoins

/obj/item/weapon/card
	var/datum/credit_card/credit = null //Generated by jobprocs
	Del()
		del credit
		..()
