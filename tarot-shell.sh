#!/bin/bash
# 
# 
#
# a bash script for drawing tarotcards on a linux machine. It works on the Debian Branch, not
# sure about others.
# 9 popular spreads are possible.
# Immage-magick, toilet, rolldice and feh are required to work. No big deal, just get them from the repositorys.
#
# You have to add your own deck to the right folder, maybe you find some free decks on the internet.
#
# Add the 78 cards in your home directory folder in /tarot-shell/Decks/Deck_1 folder ..............
# You can add till 28 decks to the program, but the size of the cards should not exceed much more then 320x560, 
# otherwise the cards will overlap.
#
# You have to rename your cards in a special way, that means you have to give them numbers, otherwise the script is not working.
# The numbers have to start with a 1, then 2, and so on, till 77,78.
# It's not possible to have a card that is a 0.
# Maybe you give the Fool the number 78. But that is not fixed, just avoid the zero.
#
# If you don't have terminal experience, follow the next steps, because you have to make the script excutable.
# Open your terminal and create a folder in your $HOME directory, call it maybe bin.
# Go in the bin directory with the command "cd bin".
#
# Download the script from github and put it in the folder bin. 
# Then make the script excutable with " sudo chmod +x tarot-shell.sh" and then your password is required.
#
#
# 
# 
# Then make the script excutable with " sudo chmod +x tarot-shell.sh"
# And then your password is required.
#
# Start the script with ./tarot-shell.sh and the script will create several folders.
# 
# After it stops, the script asks you for your name, now add your tarotcards to the $HOME/tarot-shell/Decks/ folder.
# Then proceed with the script.
# Have fun and it would be nice if you contact me if its not working, but of course this is just a hobby project so don't
# expect to much.

# 
#     Table of content (somehow)
#	line 96 check if the backgroundfiles are existing 
#       line 141 Creation of the background "leap of faith"	
#	183 astrological Spread background
#	261 Sword background creation
#	line 349 checks if the backgroundfiles for the celtic cross is existing
#       line 350 toilet (starts the while loop)

#       582 single card reading 
#	line 584 little cross reading
#	560 Choice of the Spreads
#	752 Astrological Spread
#	825 Relationship Spread
# 	888 Sword Spread
#	951 Big Five Spread

# 	line 1012 leonardo or ideal and reality
#	line 1079 celtic cross spread

#       actuell line is 556


#set -x






# The following lines are for checking that necessary programms are installed
command -v convert >/dev/null 2>&1 || { echo >&2 "I require imagemagick but it's not installed.  Aborting."; exit 1; }
command -v rolldice >/dev/null 2>&1 || { echo >&2 "I require rolldice but it's not installed.  Aborting."; exit 1; }
command -v feh >/dev/null 2>&1 || { echo >&2 "I require feh but it's not installed.  Aborting."; exit 1; }
# Ubuntu font
command -v toilet >/dev/null 2>&1 || { echo >&2 "I require toilet but it's not installed. Please install it with (sudo apt-get install toilet. Aborting."; exit 1; }




# Setup the program 
# The following lines are checking if the Tarot-suite file and the .tarot-shell file and similar files exist.
if [ -d "$HOME/tarot-shell" ] 
then
		echo "hi" | grep "use this hack to hide the oputut :) "
    else
	        echo "Directory /path/to/tarot-shell does not exists, but will be created."
		mkdir -p ~/tarot-shell
	fi



if [ -d "$HOME/.tarot-shell" ] 
then
		echo "hi" | grep "use this hack to hide the oputut :) "
    else
	        echo "Directory /path/to/.tarot-shell does not exists, but will be created."
		mkdir -p ~/.tarot-shell
	fi

if [ -d "$HOME/tarot-shell/Decks" ] 
then
		echo "hi" | grep "use this hack to hide the oputut :) "
    else
	        echo "Directory /path/to/tarot-shell/Decks does not exists, but will be created."
		mkdir -p ~/tarot-shell/Decks
	fi

if [ -d "$HOME/tarot-shell/Database" ] 
then
		echo "hi" | grep "use this hack to hide the oputut :) "

    else
	        echo "Directory /path/to/tarot-shell/Database does not exists, but will be created."
		mkdir -p ~/tarot-shell/Database
fi
if [ -d "$HOME/tarot-shell/readings/without_Question" ]
then
		echo "hi" | grep "use this hack to hide the oputut :) "
		
		else	
		mkdir $HOME/tarot-shell/readings/without_Question
fi 

if [ -d "$HOME/tarot-shell/readings/" ]
then
		echo "hi" | grep "use this hack to hide the oputut :) "
		
		else	
		mkdir $HOME/tarot-shell/readings/spreadshow
fi 


# check if the background exist and otherwise their creation.
if [ -d "$HOME/.tarot-shell/Legesysteme/Hintergrund" ] 
then
		echo "hi" | grep "use this hack to hide the oputut :) "
    else
	        echo "Directory /path/to/.tarot-shell/Legesysteme/Hintergrund does not exists, but will be created."
		mkdir -p $HOME/.tarot-shell/Legesysteme
	        mkdir -p $HOME/.tarot-shell/Legesysteme/Hintergrund
	 

	fi

	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/kl_Kreuz_Hintergrund.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "

else
	echo "The background for the little cross spread will be made."
		convert -size 2400x1350 xc:thistle /tmp/klstart1.JPG  
		convert -border 20 -bordercolor maroon2 /tmp/klstart1.JPG /tmp/klstart22.JPG

	convert -pointsize 50 -font Ubuntu-Bold -fill snow -box PaleVioletRed1 -annotate +100+90 "THE LITTLE CROSS SPREAD" /tmp/klstart22.JPG /tmp/klstart2.JPG

		convert -pointsize 25 -font Ubuntu-Bold -fill gray28 -box PaleVioletRed1 -annotate +40+1000 "1. The left card stands for the theme." /tmp/klstart2.JPG /tmp/klstart3.JPG  

		convert -pointsize 25 -font Ubuntu-Bold -fill gray28 -box PaleVioletRed1 -annotate +40+1050 "2. The right card stands for the non-recommended approach." /tmp/klstart3.JPG /tmp/klstart4.JPG
		convert -pointsize 25 -font Ubuntu-Bold -fill gray28 -box PaleVioletRed1 -annotate +40+1100 "3. The upper card stands for the recommended approach." /tmp/klstart4.JPG /tmp/klstart5.JPG 

		convert -pointsize 25 -font Ubuntu-Bold -fill gray28 -box PaleVioletRed1 -annotate +40+1150 "4. The lower card stands for the result." /tmp/klstart5.JPG /tmp/klstart6.JPG
		mv /tmp/klstart6.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/kl_Kreuz_Hintergrund.JPG
 
#____________________________________________________________________________________________________________________________________________

		  
	fi

	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/single_card_reading.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "
else
	echo " The background for the single card reading will be created now."
# The picture with the size of 1366x768 is for a 15.4 zoll display
	convert -size 1366x768 xc:thistle /tmp/start1.JPG  
	convert -border 10 -bordercolor lavender /tmp/start1.JPG /tmp/start1222.JPG	
	
	convert -pointsize 30 -font Ubuntu-Bold -fill MidnightBlue -box lavender -annotate +50+50 "SPREAD: SINGLE CARD" /tmp/start1222.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/single_card_reading.JPG
	
	
	

	fi
#_________________________________________________________________________________________________________________
# check if the background for the "LEAP OF FAITH - SPREAD" reading is there



	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/Mut_zur_Lücke.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "

else
	echo " The background for the 'Mut zur Lücke' reading will be created now."
	convert -size 3000x1800 xc:sienna2 /tmp/mustart1.JPG  
	convert -border 30 -bordercolor sienna4 /tmp/mustart1.JPG /tmp/mustart2.JPG
	convert -pointsize 80 -font Ubuntu-bold -fill DarkGoldenrod4 -box goldenrod1 -annotate +40+120 "SPREAD: LEAP of Faith" /tmp/mustart2.JPG /tmp/mustart3.JPG



	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +40+1586 "1 = This is possible; 2 = This is necessary; 3 = This is cheerful; \n 4 = This is funny; 5= This way it goes on; 6 = This is void; \n 7 = This is brave; 8 = This is important" /tmp/mustart3.JPG /tmp/mustard4.JPG 
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +210+870 "1" /tmp/mustard4.JPG /tmp/mustard5.JPG
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +560+670 "2" /tmp/mustard5.JPG /tmp/mustard6.JPG
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +870+470 "3" /tmp/mustard6.JPG /tmp/mustard7.JPG
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +1260+170 "4" /tmp/mustard7.JPG /tmp/mustard8.JPG
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +1610+170 "5" /tmp/mustard8.JPG /tmp/mustard9.JPG
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +1960+470 "6" /tmp/mustard9.JPG /tmp/mustard10.JPG
	
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +2310+670 "7" /tmp/mustard10.JPG /tmp/mustard11.JPG
	convert -pointsize 35 -font Ubuntu-bold -fill OrangeRed4 -box tan1 -annotate +2660+870 "8" /tmp/mustard11.JPG /tmp/mustard12.JPG
	
	
	
	
	
	
	mv /tmp/mustard12.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/Mut_zur_Lücke.JPG
	
	
fi
#____________________________________________________________________________________________________________________________	
	# check if the background for the "astrological reading " is there

	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/astro-reading_background.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "
else
	echo "The background for the 'astrological reading' reading will be created now."


	convert -size 3072x2200 xc:thistle /tmp/astart01.JPG
	convert -border 30 -bordercolor magenta /tmp/astart01.JPG /tmp/astart2.JPG




	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +136+820 "1" /tmp/astart2.JPG /tmp/ast1.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +536+1120 "2" /tmp/ast1.JPG /tmp/ast3.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +936+1220 "3" /tmp/ast3.JPG /tmp/tausgang4.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +1336+1420 "4" /tmp/tausgang4.JPG /tmp/tausgang5.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +1736+1220 "5" /tmp/tausgang5.JPG /tmp/tausgang6.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed -box tan1 -annotate +2136+1120 "6" /tmp/tausgang6.JPG /tmp/tausgang7.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +2536+820 "7" /tmp/tausgang7.JPG /tmp/tausgang8.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +2136+480 "8" /tmp/tausgang8.JPG /tmp/tausgang9.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +1736+360 "9" /tmp/tausgang9.JPG /tmp/tausgang10.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +1336+250 "10" /tmp/tausgang10.JPG /tmp/tausgang11.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +936+360 "11" /tmp/tausgang11.JPG /tmp/tausgang12.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +536+480 "12" /tmp/tausgang12.JPG /tmp/tausgang13.JPG



	convert -pointsize 30 -font Ubuntu-Bold -fill gray49 -annotate +50+1910 "1. Basic Moods, related to all other filds (Aries) \n 2. Finanzes, security,expenses and income (Taurus) \n 3. Every day experiences, communication, (Gemini) " /tmp/tausgang13.JPG /tmp/tausgang13a.JPG


	convert -pointsize 30 -font Ubuntu-Bold -fill gray49 -annotate +2100+1910 "4. Home life, Sibblings, Family, retreat area (Cancer) \n 5. Pleasures, loveaffairs, the play with children, money, love, etc.(Leo) \n 6. Work and health, daily tasks, method of working (Virgo) " /tmp/tausgang13a.JPG /tmp/tausgang13b.JPG


	convert -pointsize 30 -font Ubuntu-Bold -fill gray49 -annotate +2100+210 "9. Higher Insight, inner and outer journeys, convictions (Sagittarius) \n 8. Taboos, sexuality, okkult experiences, (Skorpio) \n 7. Partnerships, Love, Marriage, (Libra) " /tmp/tausgang13b.JPG /tmp/tausgang13c.JPG


	convert -pointsize 30 -font Ubuntu-Bold -fill gray49 -annotate +50+210 "10. Career, profession, reputation, public recognition (Capricorn) \n 11. Friendships, Groupexperiences (Aquarius) \n 12. Secret hopes, wishes and fears related to the other cards (Pisces) " /tmp/tausgang13c.JPG /tmp/tausgang14.JPG








	convert -pointsize 80 -font Ubuntu-bold -fill DeepSkyBlue4 -box snow1 -annotate +120+120 "  THE ASTROLOGICAL SPREAD" /tmp/tausgang14.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/astro-reading_background.JPG 


fi
#______________________________________________________________________________________________________________________
	# check if the background for the "relationship spread" exists already
	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/relationship-background.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "
else
	echo "The background for the 'relationship reading' will be created now."


	convert -size 3500x2400 xc:IndianRed2 /tmp/start1.JPG
	convert -border 30 -bordercolor crimson /tmp/start1.JPG /tmp/start2.JPG
	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box snow1 -annotate +1700+750 "1" /tmp/start2.JPG /tmp/ast1.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box snow1 -annotate +2400+90 "2" /tmp/ast1.JPG /tmp/ast3.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box snow1 -annotate +2400+750 "3" /tmp/ast3.JPG /tmp/tausgang4.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box snow1 -annotate +2400+1440 "4" /tmp/tausgang4.JPG /tmp/tausgang5.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box snow1 -annotate +900+1440 "5" /tmp/tausgang5.JPG /tmp/tausgang6.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box snow1 -annotate +900+750 "6" /tmp/tausgang6.JPG /tmp/tausgang7.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box snow1 -annotate +900+90 "7" /tmp/tausgang7.JPG /tmp/tausgang8.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill indigo -annotate +60+2200 " 1     = Significator - shows the situation  \n 2+7 = Conscious plane - what is in the head of everybody \n 6+3 = Heart plane - what everybody feels or desires \n 5+4 = Performance plane - how everybody appears in truth or as a facade " /tmp/tausgang8.JPG /tmp/tausgang9.JPG
	
	convert -pointsize 80 -font Ubuntu-bold -fill DarkSlateGrey -box OliveDrab1 -annotate +1330+150 "RELATIONSHIP SPREAD " /tmp/tausgang9.JPG /tmp/start3.JPG 
	convert -pointsize 50 -font Ubuntu-bold -fill indigo -box azure3 -annotate +2800+200 "Partner" /tmp/start4.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/relationship-background.JPG
	
	
fi	
#_________________________________________________________________________________________________________________________


# check if the background for the "Sword Reading" is already existing



	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/sword-background.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "
else
	echo "The background for the 'sword reading' will be created now."


	convert -size 3555x2000 xc:OliveDrab1 /tmp/ausgang1.JPG
	convert -border 30 -bordercolor yellow /tmp/ausgang1.JPG /tmp/ausgang2.JPG
	
	
	
	





	convert -pointsize 80 -font Ubuntu-bold -fill magenta -box SpringGreen1 -annotate +1000+130 "SPREAD: 'THE SWORD'" /tmp/ausgang2.JPG /tmp/ausgang3.JPG 
	convert -pointsize 50 -font Ubuntu-bold -box DarkOliveGreen1 -annotate +2350+1260 "1 = The core of the issue" /tmp/ausgang3.JPG /tmp/ausgang4.JPG 
	convert -pointsize 50 -font Ubuntu-bold -box DarkOliveGreen1 -annotate +2350+1320 "2 = Your leverage point" /tmp/ausgang4.JPG /tmp/ausgang17.JPG 
	convert -pointsize 50 -font Ubuntu-bold -box DarkOliveGreen1 -annotate +2350+1380 "3. Your base, your strut" /tmp/ausgang17.JPG /tmp/ausgang18.JPG 
	convert -pointsize 50 -font Ubuntu-bold -box DarkOliveGreen1 -annotate +2350+1440 "4. Your chance/what will help you" /tmp/ausgang18.JPG /tmp/ausgang19.JPG 
	convert -pointsize 50 -font Ubuntu-bold -box DarkOliveGreen1 -annotate +2350+1500 "5. A problem will be solved" /tmp/ausgang19.JPG /tmp/ausgang20.JPG 
	convert -pointsize 50 -font Ubuntu-bold -box DarkOliveGreen1 -annotate +2350+1560 "6. A wish is fullfilled" /tmp/ausgang20.JPG /tmp/ausgang21.JPG
	convert -pointsize 50 -font Ubuntu-bold -box DarkOliveGreen1 -annotate +2350+1620 "7. New insights/new comprehension" /tmp/ausgang21.JPG /tmp/ausgang22.JPG
	convert -pointsize 70 -font Ubuntu-bold -box MintCream -annotate +510+820 "1" /tmp/ausgang22.JPG /tmp/ausgang222.JPG
	convert -pointsize 70 -font Ubuntu-bold -box MintCream -annotate +50+620 "2" /tmp/ausgang222.JPG /tmp/ausgang23.JPG
	convert -pointsize 70 -font Ubuntu-bold -box MintCream -annotate +510+1400 "3" /tmp/ausgang23.JPG /tmp/ausgang24.JPG
	convert -pointsize 70 -font Ubuntu-bold -box MintCream -annotate +510+250 "4" /tmp/ausgang24.JPG /tmp/ausgang25.JPG
	convert -pointsize 70 -font Ubuntu-bold -box MintCream -annotate +1000+620 "5" /tmp/ausgang25.JPG /tmp/ausgang26.JPG
	convert -pointsize 70 -font Ubuntu-bold -box MintCream -annotate +1400+620 "6" /tmp/ausgang26.JPG /tmp/ausgang27.JPG
	convert -pointsize 70 -font Ubuntu-bold -box MintCream -annotate +1900+620 "7" /tmp/ausgang27.JPG  $HOME/.tarot-shell/Legesysteme/Hintergrund/sword-background.JPG
	

fi
	
#________________________________________________________________________________________________________________
# check if the background for the reading the "big five" exists already and or the creation of it

	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/big-five-background.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "
else
	echo "The background for the 'big-five reading' will be created now."


	convert -size 2600x1600 xc:chartreuse1 /tmp/ausgang13.JPG
	convert -border 30 -bordercolor gold /tmp/ausgang13.JPG /tmp/ausgang12.JPG
	convert -pointsize 80 -font Ubuntu-bold -fill OliveDrab1 -box DarkOliveGreen -annotate +100+130 " SPREAD - THE BIG FIVE " /tmp/ausgang12.JPG /tmp/ausgang11.JPG


	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +50+630 "1" /tmp/ausgang11.JPG /tmp/ast1.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +450+630 "2" /tmp/ast1.JPG /tmp/ast3.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +850+630 "3" /tmp/ast3.JPG /tmp/tausgang4.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +1250+630 "4" /tmp/tausgang4.JPG /tmp/tausgang5.JPG
 	convert -pointsize 40 -font Ubuntu-Bold -fill OrangeRed4 -box tan1 -annotate +1650+630 "5" /tmp/tausgang5.JPG /tmp/tausgang14.JPG



	convert -pointsize 40 -font Ubuntu-bold -fill OliveDrab1 -box DarkOliveGreen -annotate +2100+960 "1 = Extraversion" /tmp/tausgang14.JPG /tmp/ausgang16.JPG
	convert -pointsize 40 -font Ubuntu-bold -fill OliveDrab1 -box DarkOliveGreen -annotate +2100+1020 "2 = Agreeableness" /tmp/ausgang16.JPG /tmp/ausgang17.JPG
	convert -pointsize 40 -font Ubuntu-bold -fill OliveDrab1 -box DarkOliveGreen -annotate +2100+1080 "3 = Neurotizism" /tmp/ausgang17.JPG /tmp/ausgang18.JPG
	convert -pointsize 40 -font Ubuntu-bold -fill OliveDrab1 -box DarkOliveGreen -annotate +2100+1140 "4 =  Conscientiousness" /tmp/ausgang18.JPG /tmp/ausgang19.JPG
	convert -pointsize 40 -font Ubuntu-bold -fill OliveDrab1 -box DarkOliveGreen -annotate +2100+1200 "5 = Openness" /tmp/ausgang19.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/big-five-background.JPG

	
	
fi	
	
	
#________________________________________________________________________________________________________________________	
# 
	# The Spread is called "Ideal and Reality" or Leonardo
	# check if the background for the reading the "Leonardo" exists already and or the creation of it

	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/leonardo-background.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "
else
	echo "The background for the 'leonardo reading' will be created now."


# The background for the reading system "Leonardo or Ideal and Reality will be created with the next lines
convert -size 3733x2100 xc:cornsilk3 /tmp/leo.JPG
convert -pointsize 80 -font Ubuntu-Bold -box khaki1 -annotate +40+100 "Spread: Leonardo or Ideal and Reality" /tmp/leo.JPG /tmp/leo1.JPG
convert -border 40 -bordercolor orchid4 /tmp/leo1.JPG /tmp/leo2.JPG


convert -pointsize 30 -font Ubuntu-Bold -fill LavenderBlush4 -annotate +50+800 "The subject \n    1 = The subject and its conscious aspect \n     9 = The subject and is unconscious aspect" /tmp/leo2.JPG /tmp/leo4.JPG


convert -pointsize 30 -font Ubuntu-Bold -fill LavenderBlush4 -annotate +50+1000 "The basis \n   4 = The basis, the foundation on which the querent stays \n     7 = A deed, that strenghtens the foundation \n     8 = A insight or comprehension \n         that strengthens the foundation" /tmp/leo4.JPG /tmp/leo5.JPG

convert -pointsize 30 -font Ubuntu-Bold -fill LavenderBlush4 -annotate +50+1300 "The goal \n    2 = The tangible goal \n    5 = It's higher meaning \n    3 = Hopes and fears \n    6 = Unexpected Influences" /tmp/leo5.JPG /tmp/leo7.JPG


convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1800+60 "1" /tmp/leo7.JPG /tmp/leo8.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1400+400 "5" /tmp/leo8.JPG /tmp/leo9.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +2200+400 "6" /tmp/leo9.JPG /tmp/leo11.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1000+730 "2" /tmp/leo11.JPG /tmp/leo12.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +2600+730 "3" /tmp/leo12.JPG /tmp/leo13.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1800+730 "9" /tmp/leo13.JPG /tmp/leo14.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1400+1100 "8" /tmp/leo14.JPG /tmp/leo16.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +2200+1100 "7" /tmp/leo16.JPG /tmp/leo17.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1800+1400 "4" /tmp/leo17.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/leonardo-background.JPG
 
fi
	




# check if the background for the reading the "Celtic Cross Background" exists already and or the creation of it

	if [ -f "$HOME/.tarot-shell/Legesysteme/Hintergrund/celtic_cross-background.JPG" ] 
then 
		echo "hi" | grep "use this hack to hide the oputut :) "
else
	echo "The background for the 'celtic cross spread' will be created now."


# The background for the reading system "Celtic Cross" will be created with the next lines
convert -size 3733x2436 xc:cornsilk3 /tmp/leo.JPG
convert -pointsize 80 -font Ubuntu-Bold -box khaki1 -annotate +40+100 "Celtic Cross Spread" /tmp/leo.JPG /tmp/leo1.JPG
convert -border 40 -bordercolor orchid4 /tmp/leo1.JPG /tmp/leo2.JPG

convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +900+890 "1" /tmp/leo2.JPG /tmp/leo8.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1280+890 "2" /tmp/leo8.JPG /tmp/leo9.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +900+230 "3" /tmp/leo9.JPG /tmp/leo11.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +900+1550 "4" /tmp/leo11.JPG /tmp/leo12.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +520+890 "5" /tmp/leo12.JPG /tmp/leo13.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +1700+1290 "6" /tmp/leo13.JPG /tmp/leo14.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +2200+1640 "7" /tmp/leo14.JPG /tmp/leo16.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +2550+1240 "8" /tmp/leo16.JPG /tmp/leo17.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +2900+840 "9" /tmp/leo17.JPG /tmp/leo18.JPG
convert -pointsize 40 -font Ubuntu-Bold -fill black -box white -annotate +3250+440 "10" /tmp/leo18.JPG /tmp/leo19.JPG





convert -pointsize 50 -font Ubuntu-Bold -fill LavenderBlush4 -annotate +1550+200 "1 = Initial situation \n 2 = A beneficial or hindering Impulse \n 3 = The conscious plane \n 4 = The area of the unconscious \n 5 = The recent past \n 6 = A glance in to the near future \n 7 = This way it is perceived by the querent \n 8 = This way it is perceived by other, or the place where it is happening \n 9 = Hopes and or fears \n 10 = The outcome or where all is leading" /tmp/leo19.JPG $HOME/.tarot-shell/Legesysteme/Hintergrund/celtic_cross-background.JPG



# the next line is for displaying all the different spread in the file /tarot-shell/readings/spreadshow/

mkdir $HOME/tarot-shell/readings
mkdir $HOME/tarot-shell/readings/spreadshow
cp $HOME/.tarot-shell/Legesysteme/Hintergrund/*.JPG $HOME/tarot-shell/readings/spreadshow  
 
fi
clear
toilet -t -f smmono12.tlf --gay -F border - '"TAROT SHELL"' -
	echo "
What is your name? (no space in name possible!!)
	"
	read realname

	folderyear=`date +%Y`
	#echo $folderyear
	mkdir -p $HOME/tarot-shell/readings/"$realname"/
	mkdir -p $HOME/tarot-shell/readings/"$realname"/$folderyear
	
# Absatz 5.0	
	
	
	
	
#set -x
	while [[ $REPLY != 0 ]]; do
#clear




	########################################################################################################



	
	echo "$(tput setaf 1) $(tput setab 3)    Hi $realname !    $(tput sgr 0)"
clear
toilet -t -f smmono12.tlf --gay -F border - The Tarot-Shell -

	echo "
HI $realname
What can I do for you $realname?"
echo "
a. Tarot Reading 		b. Reading for another Person           c. exit 
"
#date

read choice
	if test "$choice" = "1"; then
	echo " NO MUSS ... NO FUSS!"
	 DATE=`date +%Y.%m.%d.%M.%S`         
	dateiname=${DATE}_${NAME}.JPG	

#  The following lines is for firing a single reading up and saving it to a special file, just for spontanity.

#NO Muss .. NO Fuss Reading
	 DATE=`date +%Y.%m.%d.%s`         
	dateiname=${DATE}_without_Question.JPG	
	

	var1=$(rolldice 1d78)
	composite -geometry +800+30 $HOME/tarot-shell/Decks/Deck_1/$var1 $HOME/.tarot-shell/Legesysteme/Hintergrund/single_card_reading.JPG /tmp/tausgang.JPG
	convert -pointsize 25 -font Ubuntu-bold -fill MidnightBlue -annotate +40+470 "Question: ?" /tmp/tausgang.JPG /tmp/tausgang5.JPG
	convert -pointsize 10 -font Ubuntu-bold -fill fuchsia -geometry +40+500 -annotate +40+550 "$dateiname" /tmp/tausgang5.JPG /tmp/tausgang6.JPG 
	var2=$(date)
	convert -pointsize 10 -font Ubuntu-bold -fill fuchsia -geometry +40+500 -annotate +40+570 "$var2" /tmp/tausgang6.JPG /tmp/tausgang7.JPG
	mv /tmp/tausgang7.JPG $dateiname
	feh -F $dateiname
	mv $dateiname /$HOME/tarot-shell/readings/without_Question/$dateiname
	echo $dateiname 
	unset dateiname
continue
	

	elif test "$choice" = "a"; then
	echo "MAY THE TAROT WITH YOU "$realname"!"	

	elif test "$choice" = "b"; then
	echo " You have choosen 'Reading for another Person'"
	exec $0 #$HOME/raider-waite.sh # 
	elif test "$choice" = "c"; then

#The break statement skips program execution to the end while loop and executes any statements following it.	

	break 
	

	
fi
	echo "
Your choice of the tarotdecks!

1. Tarot deck 			2. Tarot deck 			3. Tarot deck
4. Tarot deck			5. Tarot deck			6. Tarot deck
"


read Deck
var="Deck"
echo $var
echo "Sie haben $Deck gewählt."
         if test "$Deck" = "1"; then
         tarotpfad="/$HOME/tarot-shell/Decks/Deck_1"
 
 
 
 
         elif test "$Deck" = "2"; then
         tarotpfad="/$HOME/tarot-shell/Decks/Deck_2"
 
        elif test "$Deck" = "3"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_3" 
	
	elif test "$Deck" = "4"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_4"
	
	elif test "$Deck" = "5"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_5"

	elif test "$Deck" = "6"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_6"
 
	
	elif test "$Deck" = "7"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_7"
	
	
	elif test "$Deck" = "8"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_8"

	elif test "$Deck" = "9"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_9"
	
	elif test "$Deck" = "10"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_10"

	elif test "$Deck" = "11"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_11"
	

	elif test "$Deck" = "12"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_12"
	

	elif test "$Deck" = "13"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_13"

	
	elif test "$Deck" = "14"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_14"


	elif test "$Deck" = "15"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_15"

	elif test "$Deck" = "16"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_16"


	elif test "$Deck" = "17"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_17"


	elif test "$Deck" = "18"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_18"


	elif test "$Deck" = "19"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_19"


	elif test "$Deck" = "20"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_20"
	
	
	elif test "$Deck" = "21"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_21"


	elif test "$Deck" = "22"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_22"

	elif test "$Deck" = "23"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_23"


	elif test "$Deck" = "24"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_24"


	elif test "$Deck" = "25"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_25"

	elif test "$Deck" = "26"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_26"
	

	elif test "$Deck" = "27"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_27"

	elif test "$Deck" = "28"; then
	tarotpfad="/$HOME/tarot-shell/Decks/Deck_28"


	
	
	
	fi


echo "
Please select:
1 = One Card Reading				6 = The Sword
2 = The little Cross	                        7 = The Big Five
3 = Leap of Faith				8 = Leonardo or Ideal and Reality
4 = astrological Reading				9 = The Celtic Cross Spread	
5 = Relationship Spread
0 = Quit
99 = back
"

read Nummer
var=$Nummer
#echo Sie haben $var gewählt.
	# let the programm run out
	if test "$Nummer" = "0"; then
	clear
	toilet -t -f smmono12.tlf --gay -F border Namaste Brother !!! 
	exit
#________________________________________________________________________________________________________________________	
# Paragraph 5.1


# The next lines are for a single Card Drawing	
	# das ist Absatz 1
	elif test "$Nummer" = "1"; then 
	echo "That is a single card spread."
	# 1. Absatz -eine Karte ziehen-	
	echo "Enter the filename! (no space in filename possible!!)"
	
	read dateiname 
	
	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d`         
	dateiname=${DATE}_${NAME}.JPG	


	echo "Enter the question!"
	read frage
# Following packs Data in the Database
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	
	fi	
	#
#

 

# One Card Reading
	var1=$(rolldice 1d78)
	composite -geometry +800+30 $tarotpfad/$var1 $HOME/.tarot-shell/Legesysteme/Hintergrund/single_card_reading.JPG /tmp/tausgang.JPG
	convert -pointsize 25 -font Ubuntu-bold -fill MidnightBlue -annotate +40+690 "Question: $frage" /tmp/tausgang.JPG /tmp/tausgang5.JPG
	convert -pointsize 10 -font Ubuntu-bold -fill gray21 -annotate +1000+710 "$dateiname" /tmp/tausgang5.JPG /tmp/tausgang6.JPG 
	var2=$(date)
	convert -pointsize 10 -font Ubuntu-bold -fill gray21 -annotate +1000+730 "$var2" /tmp/tausgang6.JPG /tmp/tausgang7.JPG
	mv /tmp/tausgang7.JPG /tmp/$dateiname
	feh -F /tmp/$dateiname
	mv /tmp/$dateiname /$HOME/tarot-shell/readings/$realname/$folderyear/$dateiname
	

	echo $dateiname 
       #________________________________________________________________________________________________________________

       
       
# Paragraph 5.2	

	# 2 Paragraph
	elif test "$Nummer" = "2"; then
	echo "This is the little Cross Spread"
	# 2. Absatz - kleines kreuz-
	echo "How is the filename! (no space in filename possible!!)"
	read dateiname
	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d`         
	dateiname=${DATE}_${NAME}.JPG	
	echo "How is the Question"
	read frage
#

	
# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	

	fi	 
	var1=$(rolldice 1d78)
	var2=$(rolldice 1d78)
	var3=$(rolldice 1d78)
	var4=$(rolldice 1d78)
	composite -geometry +1150+330 $tarotpfad/$var1 $HOME/.tarot-shell/Legesysteme/Hintergrund/kl_Kreuz_Hintergrund.JPG /tmp/tausgang.JPG
	composite -geometry +1950+330 $tarotpfad/$var2 /tmp/tausgang.JPG /tmp/tausgang2.JPG
	composite -geometry +1550+50 $tarotpfad/$var3 /tmp/tausgang2.JPG /tmp/tausgang3.JPG
	composite -geometry +1550+660 $tarotpfad/$var4 /tmp/tausgang3.JPG /tmp/tausgang4.JPG
	convert -pointsize 40 -font Ubuntu-bold -annotate +40+1320 "Question: $frage" /tmp/tausgang4.JPG /tmp/tausgang5.JPG
	convert -pointsize 20 -font Ubuntu-bold -fill LavenderBlush4 -annotate +1900+1200 "$dateiname" /tmp/tausgang5.JPG /tmp/tausgang6.JPG
	var5=$(date)
	convert -pointsize 20 -font Ubuntu-bold -fill LavenderBlush4 -annotate +1900+1250 "$var5" /tmp/tausgang6.JPG /tmp/tausgang7.JPG
	mv /tmp/tausgang7.JPG /tmp/$dateiname
	feh -F /tmp/$dateiname
	mv /tmp/$dateiname $HOME/tarot-shell/readings/$realname/$folderyear/$dateiname
	echo $dateiname 

        #_____________________________________________________________________________________________________________

# Paragraph 5.3
	
	# Faith of Leap Spread
	elif test "$Nummer" = "3"; then
        echo "This is the Faith of Leap Spread"
	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d.%s`         
	dateiname=${DATE}_Mut_zur_Lücke.JPG	
  #     a comment if necessary 
        echo "You want to include a comment?"
        read frage

	# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
		echo "hi" | grep "use this hack to hide the oputut :) "
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "Mut zur Lücke" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	

	fi	 


	rolldice 8x1d78 > /tmp/rolldice.txt
	IFS=" " read moeglich noetig heiter witzig weiter nichtig mutig wichtig < /tmp/rolldice.txt

	composite -geometry +50+900 $tarotpfad/$moeglich $HOME/.tarot-shell/Legesysteme/Hintergrund/Mut_zur_Lücke.JPG /tmp/tausgang1.JPG
	composite -geometry +400+700 $tarotpfad/$noetig /tmp/tausgang1.JPG /tmp/tausgang2.JPG
	composite -geometry +750+500 $tarotpfad/$heiter /tmp/tausgang2.JPG /tmp/tausgang3.JPG
	composite -geometry +1100+200 $tarotpfad/$witzig /tmp/tausgang3.JPG /tmp/tausgang4.JPG
	composite -geometry +1450+200 $tarotpfad/$weiter /tmp/tausgang4.JPG /tmp/tausgang5.JPG
	composite -geometry +1800+500 $tarotpfad/$nichtig /tmp/tausgang5.JPG /tmp/tausgang7.JPG
	composite -geometry +2150+700 $tarotpfad/$mutig /tmp/tausgang7.JPG /tmp/tausgang8.JPG 
	composite -geometry +2500+900 $tarotpfad/$wichtig /tmp/tausgang8.JPG /tmp/tausgang10.JPG
	#Schreibkram
	var5=$(date)
	convert -pointsize 35 -font Ubuntu-bold -geometry +2500+1700 -annotate +2400+1700 "$var5" /tmp/tausgang10.JPG /tmp/tausgang13.JPG
	convert -pointsize 35 -font Ubuntu-bold -annotate +100+1800 "Comment: $frage" /tmp/tausgang13.JPG /tmp/tausgang14.JPG
	#feh -F /tmp/tausgang14.JPG
	mv /tmp/tausgang14.JPG /tmp/$dateiname
	feh -F /tmp/$dateiname
	mv /tmp/$dateiname /$HOME/tarot-shell/readings/"$realname"/$folderyear/$dateiname
	echo $dateiname 

	

        #_______________________________________________________________________________________________
# Absatz 5.4

	# astrological Spread
	elif test "$Nummer" = "4"; then
        echo "This is the astrological Spread"
	echo "Enter the filename! (no space possible!!)"
        read dateiname
	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d`         
	dateiname=${DATE}_${NAME}.JPG	
      
        echo "Comment or Question?"
        read frage

#	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "Rainer Schmidt" "$DATE" "$frage" "$schluesselworte" "$dateiname" >>/$HOME/tarot-shell/Tarotdatenbank.txt

	# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	

	fi	 

        rolldice 12x1d78 > /tmp/rolldice.txt
        IFS=" " read Grundstimmung Finanzen Alltagsleben Familie Spass Beruf Liebe Hintergruendige Reisen Anerkennung Freunde Hoffnungen < /tmp/rolldice.txt
#        echo "Diese Karte steht für die Grundstimmung = $Grundstimmung"
#        echo "Diese Karte steht für die Finanzen = $Finanzen"
#        echo "Diese Karte steht für das Alltagsleben = $Alltagsleben"
#        echo "Diese Karte steht für die Familie = $Familie"
#        echo "Diese Karte steht für Spass = $Spass"
#        echo "Diese Karte steht für den Beruf = $Beruf"
#        echo "Diese Karte steht für die Liebe = $Liebe"
#        echo "Diese Karte steht für das Hintergründige = $Hintergruendige"
#        echo "Diese Karte steht für Innere und Äussere Reisen = $Reisen"
#        echo "Diese Karte steht für die öffentliche Anerkennung = $Anerkennung"
#        echo "Diese Karte steht für die Freunde = $Freunde"
#        echo "Diese Karte steht für die Hoffnungen und Ängst = $Hoffnungen"
#	
	
	composite -geometry +136+820 $tarotpfad/$Grundstimmung $HOME/.tarot-shell/Legesysteme/Hintergrund/astro-reading_background.JPG /tmp/tausgang2.JPG
        composite -geometry +536+1140 $tarotpfad/$Finanzen /tmp/tausgang2.JPG /tmp/tausgang3.JPG
        composite -geometry +936+1220 $tarotpfad/$Alltagsleben /tmp/tausgang3.JPG /tmp/tausgang4.JPG
        composite -geometry +1336+1420 $tarotpfad/$Familie /tmp/tausgang4.JPG /tmp/tausgang5.JPG
        composite -geometry +1736+1220 $tarotpfad/$Spass /tmp/tausgang5.JPG /tmp/tausgang6.JPG
        composite -geometry +2136+1140 $tarotpfad/$Beruf /tmp/tausgang6.JPG /tmp/tausgang7.JPG
        composite -geometry +2536+820 $tarotpfad/$Liebe /tmp/tausgang7.JPG /tmp/tausgang8.JPG
        composite -geometry +2136+480 $tarotpfad/$Hintergruendige /tmp/tausgang8.JPG /tmp/tausgang9.JPG
        composite -geometry +1736+360 $tarotpfad/$Reisen /tmp/tausgang9.JPG /tmp/tausgang10.JPG
        composite -geometry +1336+250 $tarotpfad/$Anerkennung /tmp/tausgang10.JPG /tmp/tausgang11.JPG
        composite -geometry +936+360 $tarotpfad/$Freunde /tmp/tausgang11.JPG /tmp/tausgang12.JPG
        composite -geometry +536+480 $tarotpfad/$Hoffnungen /tmp/tausgang12.JPG /tmp/tausgang13.JPG
	#Schreibkram
	var5=$(date)
	convert -pointsize 35 -font Ubuntu-bold -fill gray39 -annotate +2400+2200 "$var5" /tmp/tausgang13.JPG /tmp/tausgang15.JPG
convert -pointsize 65 -font Ubuntu-bold -fill gray39 -box thistle -annotate +50+2130 "Question: $frage" /tmp/tausgang15.JPG /tmp/tausgang16.JPG
	mv /tmp/tausgang16.JPG $dateiname
        feh -F $dateiname
        mv $dateiname /$HOME/tarot-shell/readings/$realname/$folderyear/$dateiname
        echo $dateiname 
     

        #________________________________________________________________________________________________________

# Paragraph 5.5

	#Relationship Spread 5 
	elif test "$Nummer" = "5"; then
        echo "This is the Relationship Spread"
	echo "Enter the filename! (no space possible!!)"
	read dateiname
	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d`         
	dateiname=${DATE}_${NAME}.JPG	
       
        echo "How is the question?"
        read frage
	echo "The querents name?"
	read querent
	# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	

	fi	 



	rolldice 7x1d78 > /tmp/rolldice.txt
	IFS=" " read signifikator r_kopf r_gefuehl r_auftreten l_kopf l_gefuehl l_auftreten< /tmp/rolldice.txt
#	echo "Das ist der Signifikator =$signifikator"
#	echo "Das ist dem Partner bewusst = $r_kopf"
#	echo "Das fühlt der Partner = $r_gefuehl"
#	echo "So tritt der Partner auf = $r_auftreten"
#	echo "So tritt der Frager auf = $l_auftreten"
#	echo "Das fühlt der Frager = $l_gefuehl"
#	echo "Das denkt der Frager = $l_kopf"
	composite -geometry +1700+760 $tarotpfad/$signifikator $HOME/.tarot-shell/Legesysteme/Hintergrund/relationship-background.JPG /tmp/tausgang.JPG
	composite -geometry +2400+100 $tarotpfad/$r_kopf /tmp/tausgang.JPG /tmp/tausgang2.JPG
	composite -geometry +2400+760 $tarotpfad/$r_gefuehl /tmp/tausgang2.JPG /tmp/tausgang3.JPG
	composite -geometry +2400+1450 $tarotpfad/$r_auftreten /tmp/tausgang3.JPG /tmp/tausgang4.JPG
	composite -geometry +900+1450 $tarotpfad/$l_auftreten /tmp/tausgang4.JPG /tmp/tausgang5.JPG
	composite -geometry +900+760 $tarotpfad/$l_gefuehl /tmp/tausgang5.JPG /tmp/tausgang7.JPG
	composite -geometry +900+100 $tarotpfad/$l_kopf /tmp/tausgang7.JPG /tmp/tausgang8.JPG 
	#Schreibkram
	var5=$(date)
	convert -pointsize 50 -font Ubuntu-bold -fill indigo -box azure3 -annotate +540+200 "$querent" /tmp/tausgang8.JPG /tmp/tausgang9.JPG 
	convert -pointsize 45 -font Ubuntu-bold -annotate +2800+2350 "$var5" /tmp/tausgang9.JPG /tmp/tausgang13.JPG
	convert -pointsize 55 -font Ubuntu-bold -fill indigo -box orange -annotate +60+2130 "Question: $frage" /tmp/tausgang13.JPG /tmp/tausgang14.JPG
	mv /tmp/tausgang14.JPG /tmp/$dateiname
	feh -F /tmp/$dateiname
	mv /tmp/$dateiname /$HOME/tarot-shell/readings/$realname/$folderyear/$dateiname

	echo $dateiname 
	#____________________________________________________________________________________________________

# Paragraph 5.6

	# The Sword
         elif test "$Nummer" = "6"; then
      	 echo "This is the spread: 'The Sword'"
	 echo "Enter the filename! 
	 no space possible!!"
    	 read dateiname
   	 var1=dateiname
  	 echo "How is the Question?"
        read frage


	# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	

	fi	 



	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d`         
	dateiname=${DATE}_${NAME}.JPG	
        rolldice 7x1d78 > /tmp/rolldice.txt
        IFS=" " read t1 t2 t3 t4 t5 t6 t7 < /tmp/rolldice.txt
#        echo "Diese Karte steht für den Kern der Sache = $t1"
#        echo "Diese Karte steht für ihren Ansatzpunkt = $t2"
#        echo "Diese Karte steht für ihre Basis, ihre Stütze = $t3"
#        echo "Diese Karte steht für ihre Chance/was ihnen zu Hilfe kommt = $t4"
#        echo "Ein Problem wird gelöst = $t5"
#        echo "Ein Wunsch geht in Erfüllung = $t6"
#        echo "Neue Erkenntnis, neues Verständnis = $t7"
	composite -geometry +550+670 $tarotpfad/$t1 $HOME/.tarot-shell/Legesysteme/Hintergrund/sword-background.JPG /tmp/tausgang2.JPG
        composite -geometry +50+670 $tarotpfad/$t2 /tmp/tausgang2.JPG /tmp/tausgang3.JPG
        composite -geometry +550+1300 $tarotpfad/$t3 /tmp/tausgang3.JPG /tmp/tausgang4.JPG
        composite -geometry +550+50 $tarotpfad/$t4 /tmp/tausgang4.JPG /tmp/tausgang5.JPG
        composite -geometry +1000+670 $tarotpfad/$t5 /tmp/tausgang5.JPG /tmp/tausgang6.JPG
        composite -geometry +1450+670 $tarotpfad/$t6 /tmp/tausgang6.JPG /tmp/tausgang7.JPG
        composite -geometry +1900+670 $tarotpfad/$t7 /tmp/tausgang7.JPG /tmp/tausgang8.JPG
	#Schreibkram
	convert -pointsize 25 -font Ubuntu-bold -fill gray11 -box DarkOliveGreen1 -annotate +2700+1995 "$dateiname" /tmp/tausgang8.JPG /tmp/tausgang15.JPG 
	convert -pointsize 55 -font Ubuntu-bold -fill indigo -box snow1 -annotate +50+1960 "Question: $frage" /tmp/tausgang15.JPG /tmp/tausgang16.JPG 
	var5=$(date)
	convert -pointsize 25 -font Ubuntu-bold -fill gray11 -box DarkOliveGreen1 -annotate +2300+1995 "$var5" /tmp/tausgang16.JPG /tmp/tausgang17.JPG
	mv /tmp/tausgang17.JPG $dateiname
        feh -F $dateiname
        mv $dateiname /$HOME/tarot-shell/readings/$realname/$folderyear/$dateiname
        echo $dateiname

	#___________________________________________________________________________________________________

# Paragraph 5.7 


	# The Big Five
         elif test "$Nummer" = "7"; then
      	 echo "This is the Spread: 'The Big Five'"	
	schluesselworte="The_Big_Five"

	dateiname="The_Big_Five"
	frage="The_Big_Five"

	NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d.%M.%s`         
	dateiname=${DATE}_${NAME}.JPG	
	
  	echo "Add hear a comment if necessary"
        read comment
	
	# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	

	fi	 


        

	rolldice 5x1d78 > /tmp/rolldice.txt
        IFS=" " read t1 t2 t3 t4 t5 < /tmp/rolldice.txt
#        echo "Extrovertiertheit = $t1"
#        echo "Verträglichkeit = $t2"
#        echo "Neurotizismus = $t3"
#        echo "Gewissenhaftigkeit = $t4"
#        echo "Offenheit = $t5"
	composite -geometry +50+630 $tarotpfad/$t1 $HOME/.tarot-shell/Legesysteme/Hintergrund/big-five-background.JPG /tmp/tausgang2.JPG
        composite -geometry +450+630 $tarotpfad/$t2 /tmp/tausgang2.JPG /tmp/tausgang3.JPG
        composite -geometry +850+630 $tarotpfad/$t3 /tmp/tausgang3.JPG /tmp/tausgang4.JPG
        composite -geometry +1250+630 $tarotpfad/$t4 /tmp/tausgang4.JPG /tmp/tausgang5.JPG
        composite -geometry +1650+630 $tarotpfad/$t5 /tmp/tausgang5.JPG /tmp/tausgang6.JPG
	#Schreibkram
	convert -pointsize 40 -font Ubuntu-bold -fill indigo -box snow1 -annotate +50+1500 "Comment: $comment" /tmp/tausgang6.JPG /tmp/tausgang6a.JPG 
	convert -pointsize 20 -font Ubuntu-bold -fill wheat4 -annotate +1800+1600 "$dateiname" /tmp/tausgang6a.JPG /tmp/tausgang15.JPG 
	var5=$(date)
	convert -pointsize 20 -font Ubuntu-bold -fill wheat4 -annotate +1800+1570 "$var5" /tmp/tausgang15.JPG /tmp/tausgang17.JPG
	mv /tmp/tausgang17.JPG $dateiname
        feh -F $dateiname
       	mv $dateiname /$HOME/tarot-shell/readings/$realname/$folderyear/$dateiname
        echo $dateiname 

#_________________________________________________________________________________________________________________________________________________
# Paragrph 5.8 


	# Leonardo or Ideal or Reality
         elif test "$Nummer" = "8"; then
      	 echo "This is the Spread: Ideal or Reality"
	 echo "Enter the filename! -  no space possible!! "
    	 read dateiname
	echo "How is the Question?"
	read frage	
	
	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d`         
	dateiname=${DATE}_${NAME}.JPG	
  	

	# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without - press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords	

	fi	 


        

	rolldice 9x1d78 > /tmp/rolldice.txt
        IFS=" " read t1 t2 t3 t4 t5 t6 t7 t8 t9 < /tmp/rolldice.txt
	composite -geometry +1800+80 $tarotpfad/$t1 $HOME/.tarot-shell/Legesysteme/Hintergrund/leonardo-background.JPG /tmp/tausgang2.JPG
        composite -geometry +1400+410 $tarotpfad/$t5 /tmp/tausgang2.JPG /tmp/tausgang3.JPG
        composite -geometry +2200+410 $tarotpfad/$t6 /tmp/tausgang3.JPG /tmp/tausgang4.JPG
        composite -geometry +1000+740 $tarotpfad/$t2 /tmp/tausgang4.JPG /tmp/tausgang5.JPG
        composite -geometry +2600+740 $tarotpfad/$t3 /tmp/tausgang5.JPG /tmp/tausgang6.JPG
        composite -geometry +1800+740 $tarotpfad/$t9 /tmp/tausgang6.JPG /tmp/tausgang7.JPG
        composite -geometry +1400+1110 $tarotpfad/$t8 /tmp/tausgang7.JPG /tmp/tausgang8.JPG
        composite -geometry +2200+1110 $tarotpfad/$t7 /tmp/tausgang8.JPG /tmp/tausgang9.JPG
        composite -geometry +1800+1410 $tarotpfad/$t4 /tmp/tausgang9.JPG /tmp/tausgang10.JPG
	#Schreibkram
	convert -pointsize 50 -font Ubuntu-bold -fill wheat4 -annotate +2400+1950 "$dateiname" /tmp/tausgang10.JPG /tmp/tausgang15.JPG 
	convert -pointsize 50 -font Ubuntu-bold -fill wheat4 -annotate +100+2100 "Question: $frage" /tmp/tausgang15.JPG /tmp/tausgang16.JPG 
	var5=$(date)
	convert -pointsize 35 -font Ubuntu-bold -fill wheat4 -annotate +2400+2000 "$var5" /tmp/tausgang16.JPG /tmp/tausgang17.JPG
	mv /tmp/tausgang17.JPG $dateiname
        feh -F $dateiname
        mv $dateiname /$HOME/tarot-shell/readings/$realname/$folderyear/$dateiname
        echo $dateiname 

#___________________________________________________________________________________________________________________________________________________

# Paragraph 5.9


	# Celtic Cross Spread
         elif test "$Nummer" = "9"; then
      	 echo "'This is the Celtic Cross Spread'"
     	 echo "What is the filename"
    	 read dateiname
	 echo " What is your question?"
	 read frage  
	 
	 
	 NAME=${dateiname%.*}
	 EXT=${FILE#.*} 
	 DATE=`date +%Y.%m.%d`         
	dateiname=${DATE}_${NAME}.JPG	

	# Folgendes packt Daten in die Datenbank
	echo "
	If you want to make a entry into the database press 1
	or without then press enter!"
	read keywordvariable 
	if test "$keywordvariable" = "1"; then
	echo "Please enter keywords!"
	read keywords
	printf "\n %-6s | %-30s | %-12s | %-50s | %-30s | %-30s" "1" "$realname" "$DATE" "$frage" "$keywords" "$dateiname" >>/$HOME/tarot-shell/Database/database.txt
	

	elif [ -t 0 ]; then	
	 
	unset keywords 

	fi	 

	rolldice 10x1d78 > /tmp/rolldice.txt
        IFS=" " read t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 < /tmp/rolldice.txt
	composite -geometry +900+900 $tarotpfad/$t1 $HOME/.tarot-shell/Legesysteme/Hintergrund/celtic_cross-background.JPG /tmp/tausgang2.JPG
	composite -geometry +1280+900 $tarotpfad/$t2 /tmp/tausgang2.JPG /tmp/tausgang3.JPG
        composite -geometry +900+240 $tarotpfad/$t3 /tmp/tausgang3.JPG /tmp/tausgang4.JPG
        composite -geometry +900+1560 $tarotpfad/$t4 /tmp/tausgang4.JPG /tmp/tausgang5.JPG
        composite -geometry +520+900 $tarotpfad/$t5 /tmp/tausgang5.JPG /tmp/tausgang6.JPG
        composite -geometry +1700+1300 $tarotpfad/$t6 /tmp/tausgang6.JPG /tmp/tausgang7.JPG
        composite -geometry +2200+1650 $tarotpfad/$t7 /tmp/tausgang7.JPG /tmp/tausgang8.JPG
        composite -geometry +2550+1250 $tarotpfad/$t8 /tmp/tausgang8.JPG /tmp/tausgang9.JPG
        composite -geometry +2900+850 $tarotpfad/$t9 /tmp/tausgang9.JPG /tmp/tausgang10.JPG
        composite -geometry +3250+450 $tarotpfad/$t10 /tmp/tausgang10.JPG /tmp/tausgang11a.JPG
	#Schreibkram
	convert -pointsize 70 -font Ubuntu-bold -fill wheat4 -annotate +100+2340 "Question: $frage" /tmp/tausgang11a.JPG /tmp/tausgang11.JPG 
	convert -pointsize 35 -font Ubuntu-bold -fill wheat4 -annotate +2400+2400 "$dateiname" /tmp/tausgang11.JPG /tmp/tausgang15.JPG 
	var5=$(date)
	convert -pointsize 35 -font Ubuntu-bold -fill wheat4 -annotate +2400+2440 "$var5" /tmp/tausgang15.JPG /tmp/tausgang17.JPG
	mv /tmp/tausgang17.JPG $dateiname
        feh -F $dateiname
        mv $dateiname /$HOME/tarot-shell/readings/$realname/$folderyear/$dateiname
        echo $dateiname 

fi
done 
	clear	
	echo "
        This project is a non-commercial personal fun project. I started that because I wanted to do
	readings for myself on my linux computer.
	Now the script is some 1200 lines long and maybe more people are interested in it.
	
	I publish this script as a open source work.
	I don't claim any professionality when it comes to coding skills. If you find bugs
	drop a mail to the the-tarot-guide@gmx, I fix them if I have the time and mood. Thanks!

	Disclaimer.
	This script comes without any waranty whatsoever. You use it on your one risk. 
	This script is only for entertaining reasons writen.
	If some tarot readings are not clear, contact a friend, a wise old man/women or an professional reader, 
	before you do something risky or irrational!
	
	"
	echo "
	The following spreads appeared in the german tarotbook 'Schlüsselworte zum Tarot', published by the
        Goldman Verlag, München, from the inspiring but sadly late Hajo Banzhaf: 
	The astrological spread, celtic spread, Leonardo or ideal and reality spread, relationship spread and the
	little cross spread.

	The spreads 'the sword and leap of faith' are taken from the German Book ' Das grosse Buch der Tarot-
	Legemuster' from Evelin Bürger and Johannes Fiebig, published by the Wilhelm Heyne Verlag, München,
	Copyright by Königsfurt Verlag.
	
	"	
	sleep 10 
	clear
	
	

	echo " 
	
	
	
	Check out my webside for some links for royalty-free downloadable tarot decks and news or further informations.
	
	
	
	
	"

	

	toilet -t -f smmono12.tlf --gay -F border www.the-tarot.guide !!! 
	


	sleep 8 
	clear
	toilet -t -f smmono12.tlf --gay -F border Bon voyage, Taronaut !!! 

	sleep 10
	clear

