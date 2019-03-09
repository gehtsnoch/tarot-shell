#  tarot-shell.sh - read tarotcards on the commandline 
a bash script for drawing tarotcards on a linux machine. 9 popular spreads are possible. 
 It works on the Debian Branch, not sure about others.
 
 Immage-magick, toilet, rolldice and feh are required to work. 
No big deal, just get them from the repositorys.




  You have to add your own deck to the right folder, maybe you find some free decks on the internet. 
 Ad the 78 cards in your home directory folder in /tarot-shell/Decks/Deck_1 folder ..............
 You can ad till 28 decks to the program.

 You have to rename your cards in a special way, that means you have to give them numbers, otherwise the script is not working.
 The numbers have to start with a 1, then 2, and so on, till 77,78. 
 It's not possible to have a card that is a 0.
 Maybe you give the Fool the number 78. But that is not fixed, just avoid the zero.

 If you don't have terminal experience, follow the next steps, because you have to make the script excutable.
 Open your terminal and create a folder in your $HOME directory, call it maybe bin.
 Go in the bin directory with the command "cd bin".
 Copy the script from github, not the html version and paste it in a editor like gedit, mousepad or leafpad ...... .
 Close the editor and call the script "tarot-shell.sh".
 then make the script excutable with " sudo chmod +x tarot-shell.sh"
 and then your password is required.
 Start the script with ./tarot-shell.sh  and the script will create several folders.
 After it stops add cards to the $HOME/tarot-shell/Decks/ folder.

 have fun and it would be nice if you contact me if its not working, but of course this is just a hobby project so don't
 expect to much. 
 


