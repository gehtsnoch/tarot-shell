#  The "tarot-shell.sh" - reads tarotcards on the commandline 
a bash script for drawing tarotcards on a linux machine. 
9 popular spreads are possible:

-One Card Reading				-The Sword 
-The little Cross	    -The Big Five
-Leap of Faith				    -Leonardo or Ideal and Reality
-astrologal Reading			-The Celtic Cross Spread	
-Relationship Spread

And as a special hack, if you are at the point where the script asks you, what it can do for you, just press 1 and it will fire up a card without more input.





It works on the Debian Branch, not sure about others.

Immage-magick, toilet, rolldice and feh are required to work. 
No big deal,I just get them from the repositorys.

You can probably run it on a 64 bit windows too, with the new windows linux subsystem, thats a linux commandline on windows and not a virtual OS. But I don't have experience with that and there are probably better programs around.
Maybe on Mac its possible too.




 You have to add your own deck to the right folder, maybe you find some free decks on the internet. 
 Add the 78 cards in your home directory folder in /tarot-shell/Decks/Deck_1 folder ..............
 You can add till 28 decks to the program, but the size of the cards should not exceed much more then 320x560, 
 otherwise the cards will overlap.

 You have to rename your cards in a special way, that means you have to give them numbers, otherwise the script is not working.
 The numbers have to start with a 1, then 2, and so on, till 77,78. 
 It's not possible to have a card that is a 0.
 Maybe you give the Fool the number 78. But that is not fixed, just avoid the zero.

 If you don't have terminal experience, follow the next steps, because you have to make the script excutable.
 Open your terminal and create a folder in your $HOME directory, call it maybe bin.
 Go in the bin directory with the command "cd bin".
 Download the script from github and put it in the folder bin.
 Then make the script excutable with " sudo chmod +x tarot-shell.sh"
 and then your password is required.
 
 Start the script with ./tarot-shell.sh  and the script will create several folders.
 After it stops, the script asks you for your name, now add your tarotcards to the $HOME/tarot-shell/Decks/ folder.
 Then proceed with the script.
 Have fun and it would be nice if you contact me if its not working, but of course this is just a hobby project so don't
 expect to much. 
 


