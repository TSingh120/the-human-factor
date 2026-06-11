/// @param text_id
function scr_gametext(_text_id){
	
	switch(_text_id) {
		
		case "NPC 1" :
		scr_text("Me? Feel like a million bucks.", "Leon");
		scr_text("Sorry, but I'm not on the menu.", "Leon");
			scr_option("Leon, get the HELL out of my game.", "NPC 1 - shoo");
			scr_option("OMG LEON I LOVE YOU.", "NPC 1 - fanboy");
			break;
			
				case "NPC 1 - shoo" :
					scr_text("Must be time for the evening service. *Scurries away*", "Leon");
					break;
				case "NPC 1 - fanboy" :
					scr_text("Didn't know I had such a big fan.", "Leon");
					break;
		
		case "NPC 2" :
		scr_text("What are you? My mother?", "Leon")
		scr_text("Where's everyone going? Bingo?", "Leon")
		scr_text("7 minutes.", "Wesker")
			scr_option("Holy shit, why are YOU here?!", "NPC 2 - Scared")
			scr_option("Wesker get outta here before I punch a boulder", "NPC 2 - Scaring")
		break;
		
			case "NPC 2 - Scared":
				scr_text("When was the last time you brushed your teeth?..... Oh no.... I'm talking like Leon now...")
				break;
			case "NPC 2 - Scaring":
				scr_text("You're merely postponing the inevitable!", "Wesker")
				break;
		
		case "NPC 3" :
		scr_text("Funny, I don't remember getting an invitation.", "Leon")
		scr_text("Shoulda worn a helmet.", "Leon")
		scr_text("Nighty-night, Knights.", "Leon")
		break;
		
	}

}