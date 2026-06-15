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
		
		case "Waking" :
		scr_text("Ahhh it feels nice to be walking around again. Good to be back. Let me take a look around.")
			scr_text_float(1, 5)
		
		case "Radio station" :
		scr_text("Let me try talking to an ally.")
		scr_text("*BZZZT")
		scr_text("GAH! This one's fried. I'll have to use another one.")
			scr_text_shake(1, 5)
			scr_text_float(16, 22)
			
		case "First contact" :
		scr_text("Kian, are you there?");
		scr_text("Yes, I'm here. Good morning, sir.", "Chris")
			scr_text_color(1, 3, c_lime, c_lime, c_lime, c_lime)
		scr_text("Oh yes. This one's working. Good to see you're still alive and that you've stuck around.")
		scr_text("I had to.", "Chris look")
			scr_text_color(2, 5, c_red, c_red, c_white, c_white)
		scr_text("Yes, you had to.")
		
		case "First enemies" :
		scr_text("That's a warm welcome. How's everything else been.")
			scr_text_float(9, 14);
			scr_text_color(9, 14, c_orange, c_orange, c_orange, c_orange)
		scr_text("It's crumbling. We're holding on, but we're stuck in a stalemate. Maybe the tides will change now that you're back.", "Chris look")
			scr_text_color(55, 64, c_aqua, c_aqua, c_aqua, c_aqua)
			
		case "Approaching boss" :
		scr_text("It seems like someone's blocking my path.")
		scr_text("Turn back", "Wesker smirk", -1)
		scr_text("I think I want a second opinion.")
		scr_text("I will not hesitate in my attacks.", "Wesker smirk", -1)
			scr_text_shake(11, 19)
		scr_text("I'll finish what's been started.")
		
		case "After bossfight" :
		scr_text("GAH! I WILL MAKE YOU PAY.", "Wesker", -1)
			scr_text_shake(7 ,24)
		scr_text("Sorry, but I'm a little tight on cash.")
			scr_text_float(1, 6)
		scr_text("N-no.. y-you, *cough* you can't just walk away free.", "Wesker", -1)
		scr_text("Well, I guess my card declined.")
			scr_text_float(17, 31)
		scr_text("They will devour you for the consequences of your own actions.", "Wesker", -1)
			scr_text_shake(5, 20)
			scr_text_color(35, 52, c_red, c_red, c_red, c_red)
		scr_text("Devour? Sorry, but I'm not on the menu.")
		
		//case "Interception" :
		
		
	}

}