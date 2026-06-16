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
		scr_text("Ahhh this feels nice to be walking around again. It's good to be back. Let me take a look around. Let me try pressing W A S D to move around. (And R to restart) [PRESS SPACE TO CONTINUE]", noone, 0, vl_player1)
			scr_text_float(0, 4)
			scr_text_color(109, 250, c_yellow, c_yellow, c_yellow, c_yellow)
		break;
		
		case "Radio station" :
		scr_text("Kian, what's your status? *BZZZT* Damn it. I have to try to establish contact with him. Maybe I should try double jumping over this gap and then slide under the next one. Better remember to slide away if I get stuck though.", noone, 0, vl_player2)
			scr_text_shake(26, 33)
			break;
			
		case "First contact" :
		scr_text("Kian, hello? Are you there?", noone, 0, vl_player3);
		scr_text("Yes, I'm here. Good morning, sir.", "Chris")
			scr_text_color(0, 3, c_lime, c_lime, c_lime, c_lime)
		scr_text("Oh finally. You're still alive. It's nice to see you stuck around after all these years.", noone, 0, vl_player4)
		scr_text("I had to.", "Chris look")
			scr_text_color(2, 5, c_red, c_red, c_white, c_white)
		scr_text("Yeah, you did.", noone, 0, vl_player5)
		break;
		
		case "Gap" :
		scr_text("'Press I to dash?' What is this? A video game?", noone, 0, vl_player_dash)
		break;
		
		case "Attack tutorial" :
		scr_text("Press J to attack and L to block. Blocking during an enemy windup causes you to parry and attacking during enemy windup counters them.", noone, 0)
		break;
		
		case "First enemies" :
		scr_text("That's a warm welcome. How's everything been?", noone, 0, vl_player6)
			scr_text_float(9, 13);
			scr_text_color(9, 13, c_orange, c_orange, c_orange, c_orange)
		scr_text("It's crumbling. We're holding on, but we're stuck in a stalemate. Maybe the tides will change now that you're back.", "Chris look")
			scr_text_color(55, 64, c_aqua, c_aqua, c_aqua, c_aqua)
			break;
			
		case "Approaching boss" :
		scr_text("It seems like someone's blocking my path.", noone, 0, vl_player7)
		scr_text("Turn back", "Wesker smirk", -1, aw_1)
		scr_text("I think I want a second opinion.", noone, 0, vl_player8)
		scr_text("I will not hesitate in my attacks.", "Wesker smirk", -1, aw_2)
			scr_text_shake(11, 19)
		scr_text("I'll finish what's been started.", noone, 0, vl_player9)
		scr_text("Very well. Time to pay. (Please don't wall jump anywhere so the boss doesn't glitch outside the room.", "Wesker smirk", -1, aw_3)
		break;
		
		case "After bossfight" :
		scr_text("GAH! I WILL MAKE YOU PAY.", "Wesker", -1, aw_4)
			scr_text_shake(7 ,24)
		scr_text("Sorry, but I'm a bit tight on cash.", noone, 0, vl_player10)
			scr_text_float(0, 6)
		scr_text("No.. you can't just walk away free.", "Wesker", -1, aw_5)
		scr_text("Well, I guess my card declined.", noone, 0, vl_player11)
			scr_text_float(17, 31)
		scr_text("They will devour you for the consequences of your own actions.", "Wesker", -1, aw_6)
			scr_text_shake(5, 20)
			scr_text_color(35, 52, c_red, c_red, c_red, c_red)
		scr_text("Devour? Sorry, but I'm not on the menu.", noone, 0, vl_player12)
		break;
		
		case "Interception" :
		scr_text("I just beat someone up, this is great.", noone, 0, vl_player13)
			scr_text_float(33, 39)
		scr_text("Do you think what he said is true?", "Chris look")
		scr_text("Sure, whatever you say.", noone, 0, vl_player14)
		scr_text("Sir pl-", "Chris look")
		scr_text("BZZT")
			scr_text_shake(0,5)
		scr_text("You aren't Leonard.", "Saddler", -1)
		scr_text("Yeah, I'm not. He's ... on a break... permanently.", noone, 0, vl_player15)
		scr_text("It seems that way, huh.", "Saddler", -1,)
		scr_text("Why don't all of you just surrender and let me fix things.", noone, 0, vl_player16)
			scr_text_color(40, 58, c_red, c_red, c_orange, c_orange)
		scr_text("Your confidence is overflowing after killing a small time subordinate. You have no idea what power I possess.", "Saddler smirk", -1)
		scr_text("Edmund. You're small time.", noone, 0, vl_player17)
			scr_text_float(8, 14)
		scr_text("No response huh?. Seems like the demo ended. Don't even have a voice line for this one. And the rooms a copy of the last one too. Sad. Imma just uhhhh... uhh press escape probably? Hopefully.", noone, 0, sahursahur)
			break;

	}

}