/// @param text_id
function scr_gametext(_text_id){
	
	switch(_text_id) {
		
		case "NPC 1" :
		scr_text("Me? Feel like a million bucks.");
		scr_text("Sorry, but I'm not on the menu.");
			scr_option("Leon, get the HELL out of my game.", "NPC 1 - shoo");
			scr_option("OMG LEON I LOVE YOU.", "NPC 1 - fanboy");
			break;
			
				case "NPC 1 - shoo" :
					scr_text("Must be time for the evening service. *Scurries away*");
					break;
				case "NPC 1 - fanboy" :
					scr_text("Didn't know I had such a big fan.");
					break;
		
		case "NPC 2" :
		scr_text("What are you? My mother?")
		scr_text("Where's everyone going? Bingo?")
		break;
		
		case "NPC 3" :
		scr_text("Funny, I don't remember getting an invitation.")
		scr_text("Shoulda worn a helmet.")
		scr_text("Nighty-night, Knights.")
		break;
		
	}

}