/// @param text_id
function scr_gametext(_text_id){
	
	switch(_text_id) {
		
		case "NPC 1" :
		scr_text("Me? Feel like a million bucks.", "Leon surprised");
		scr_text("Sorry, but I'm not on the menu.", "Leon");
				scr_text_float(0, 5);
			scr_option("Leon, get the HELL out of my game.", "NPC 1 - shoo");
			scr_option("OMG LEON I LOVE YOU.", "NPC 1 - fanboy");
			break;
			
				case "NPC 1 - shoo" :
					scr_text("Leon, get the HELL out of my game before I get Wesker to get rid of Ada.");
						scr_text_color(6, 22, c_red, c_red, c_red, c_red);
						scr_text_float(68, 73)
					scr_text("Must be time for the evening service. *Scurries away*", "Leon surprised");
					break;
				case "NPC 1 - fanboy" :
					scr_text("Didn't know I had such a big fan.", "Leon");
					break;
		
		case "NPC 2" :
		scr_text("What are you? My mother?", "Leon")
			scr_text_float(17, 24);
		scr_text("Where's everyone going? Bingo?", "Leon")
				scr_text_float(24, 29);
		scr_text("7 minutes.", "Wesker smirk", -1)
				scr_text_color(0, 10, c_red, c_red, c_white, c_white)
			scr_option("Holy shit, why are YOU here?!", "NPC 2 - Scared")
			scr_option("Wesker get outta here before I punch a boulder", "NPC 2 - Scaring")
				scr_text_float(39, 46);
		break;
		
			case "NPC 2 - Scared":
				scr_text("7 minutes is all I can spare-", "Wesker smirk", -1)
				scr_text("When was the last time you brushed your teeth?", "Leon surprised")
						scr_text_color(27, 34, c_orange, c_orange, c_orange, c_orange);
				break;
			case "NPC 2 - Scaring":
				scr_text("You're merely postponing the inevitable!", "Wesker", -1)
					scr_text_shake(29, 40);
				break;
		
		case "NPC 3" :
		scr_text("Funny, I don't remember getting an invitation.", "Leon")
			scr_text_color(0, 5, c_lime, c_lime, c_lime, c_lime);
		scr_text("Shoulda worn a helmet.", "Leon surprised")
		scr_text("Nighty-night, Knights.", "Leon")
			scr_text_color(1, 12, c_blue, c_blue, c_blue, c_blue);
		break;
		
	}

}