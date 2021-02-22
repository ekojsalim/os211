#!/bin/bash

# Taken From: https://mdzkm.github.io/os202/
# Thanks Kak Dzikra

clear

LOG_FILE="mylog.txt"
RANK_FILE="myrank.txt"
FILES="my*.txt my*.sh"
SHA="SHA256SUM"

LOG_CODES=("General Log" "SCELE related" "ZOOM related" "Github related" "Github Pages: setting, etc." "GSGS related" "Reading References/Books/Documents" "Demo related" "Trying something" "AsDos: asking, etc." "Assignment (General)" "Assignment #1" "Assignment #2" "Assignment #3" "Assignment #4" "Assignment #5" "Assignment #6" "Assignment #7" "Assignment #8" "Assignment #9" "Assignment #10" "VirtualBox: install GNU/Linux, etc." "Youtube: study, etc." "Discord: discussion, etc." "Udacity: study, etc." "C-language: study, etc." "Movie: relax, etc." "Other (...)")

echo "Choose one of the following options:"
echo "[0] Exit"
echo "[1] Add Log"
echo "[2] Add Weekly Rank"
echo "[3] Add Top 10 List"
echo "[4] Commit Log"
echo "[5] Commit Weekly Rank"
echo "[6] Commit Top 10 List"
echo "[7] Push all changes"
echo "[8] Sign files"

read -p "Enter your choice: " OPTION
clear

while [ ! $(($OPTION)) -eq 0 ]
do
	if [ $(($OPTION)) -eq 1 ]
	then
		echo "Choose current week number:"
		echo "[0]  Week 00"
		echo "[1]  Week 01"
		echo "[2]  Week 02"
		echo "[3]  Week 03"
		echo "[4]  Week 04"
		echo "[5]  Week 05"
		echo "[6]  Week 06"
		echo "[7]  Week 07"
		echo "[8]  Week 08"
		echo "[9]  Week 09"
		echo "[10] Week 10"
		echo "[11] Week 11"
		
		read -p "Your choice: " WEEK
		clear

		while [[ $(($WEEK)) -lt 0 || $(($WEEK)) -gt 11 ]]
		do
			echo "Week number must be between 0 and 11!"
			read -p "Press ENTER to continue."
			clear

			echo "Choose current week number:"
			echo "[0]  Week 00"
			echo "[1]  Week 01"
			echo "[2]  Week 02"
			echo "[3]  Week 03"
			echo "[4]  Week 04"
			echo "[5]  Week 05"
			echo "[6]  Week 06"
			echo "[7]  Week 07"
			echo "[8]  Week 08"
			echo "[9]  Week 09"
			echo "[10] Week 10"
			echo "[11] Week 11"
		
			read -p "Your choice: " WEEK
			clear
		done

		if [ $(($WEEK)) -lt 10 ]
		then
			WEEK="0$WEEK"
		fi
		
		echo "Choose log type:"
		echo "[0]  General Log"
		echo "[1]  SCELE related"
		echo "[2]  ZOOM related"
		echo "[3]  Github related"
		echo "[4]  Github Pages: setting, etc."
		echo "[5]  GSGS related"
		echo "[6]  Reading References/Books/Documents"
		echo "[7]  Demo related"
		echo "[8]  Trying something"
		echo "[9]  AsDos: asking, etc."
		echo "[10] Assignment (General)"
		echo "[11] Assignment #1"
		echo "[12] Assignment #2"
		echo "[13] Assignment #3"
		echo "[14] Assignment #4"
		echo "[15] Assignment #5"
		echo "[16] Assignment #6"
		echo "[17] Assignment #7"
		echo "[18] Assignment #8"
		echo "[19] Assignment #9"
		echo "[20] Assignment #10"
		echo "[21] VirtualBox: install GNU/Linux, etc."
		echo "[22] Youtube: study, etc."
		echo "[23] Discord: discussion, etc."
		echo "[24] Udacity: study, etc."
		echo "[25] C-language: study, etc."
		echo "[26] Movie: relax, etc."
		echo "[27] Other (...)"

		read -p "Your choice: " LOG_CODE
		clear

		while [[ $(($LOG_CODE)) -lt 0 || $(($LOG_CODE)) -gt 27 ]]
		do
			echo "Log code must be between 0 and 27!"
			read -p "Press ENTER to continue."
			clear

			echo "Choose log type:"
			echo "[0]  General Log"
			echo "[1]  SCELE related"
			echo "[2]  ZOOM related"
			echo "[3]  Github related"
			echo "[4]  Github Pages: setting, etc."
			echo "[5]  GSGS related"
			echo "[6]  Reading References/Books/Documents"
			echo "[7]  Demo related"
			echo "[8]  Trying something"
			echo "[9]  AsDos: asking, etc."
			echo "[10] Assignment (General)"
			echo "[11] Assignment #1"
			echo "[12] Assignment #2"
			echo "[13] Assignment #3"
			echo "[14] Assignment #4"
			echo "[15] Assignment #5"
			echo "[16] Assignment #6"
			echo "[17] Assignment #7"
			echo "[18] Assignment #8"
			echo "[19] Assignment #9"
			echo "[20] Assignment #10"
			echo "[21] VirtualBox: install GNU/Linux, etc."
			echo "[22] Youtube: study, etc."
			echo "[23] Discord: discussion, etc."
			echo "[24] Udacity: study, etc."
			echo "[25] C-language: study, etc."
			echo "[26] Movie: relax, etc."
			echo "[27] Other (...)"

			read -p "Your choice: " LOG_CODE
			clear
		done
		
		if [ $(($LOG_CODE)) -lt 10 ]
		then
			LOG_CODE="0$LOG_CODE"
		elif [ $(($LOG_CODE)) -eq 27 ]
		then
			LOG_CODE="100"
		fi

		read -p "How many minutes did you spend (e.g. 5, 10, 15, etc.): " MINUTES
		clear

		if [ $(($MINUTES)) -lt 10 ]
		then
			MINUTES="  $MINUTES"
		elif [ $(($MINUTES)) -lt 100 ]
		then
			MINUTES=" $MINUTES"
		fi

		read -p "Enter description (optional, press ENTER to skip): " DESCRIPTION
		clear

		if [ ! -z "$DESCRIPTION" ]
		then
			printf "ZCZC W$WEEK $MINUTES L$LOG_CODE ${LOG_CODES[$LOG_CODE]}: $DESCRIPTION\n" >> $LOG_FILE
		else
			printf "ZCZC W$WEEK $MINUTES L$LOG_CODE ${LOG_CODES[$LOG_CODE]}\n" >> $LOG_FILE
		fi

		echo "Your log has been updated!"
		read -p "Press ENTER to continue."
		clear
	elif [ $(($OPTION)) -eq 4 ]
	then
		echo "Would you like to commit and push your changes in mylog.txt? [y/N]"
		read ANSWER
		if [[ ! -z "$ANSWER" && $ANSWER == "y" || $ANSWER == "Y" ]]
		then
			git add mylog.txt
			git commit -m "Update mylog.txt"
			echo "Your changes has been comitted."
			clear
		else
			echo "Your changes has not been comitted."
			read -p "Press ENTER to continue."
			clear
		fi
	elif [ $(($OPTION)) -eq 5 ]
	then
		echo "Would you like to commit and push your changes in myrank.txt? [y/N]"
		read ANSWER
		if [[ ! -z "$ANSWER" && $ANSWER == "y" || $ANSWER == "Y" ]]
		then
			git add myrank.txt
			git commit -m "Update myrank.txt"
			echo "Your changes have been comitted."
			read -p "Press ENTER to continue."
			clear
		else
			echo "Your changes have not been comitted."
			read -p "Press ENTER to continue."
			clear
		fi
	elif [ $(($OPTION)) -eq 7 ]
	then
		echo "Would you like to push all your commits? [y/N]"
		read ANSWER
		if [[ ! -z "$ANSWER" && $ANSWER == "y" || $ANSWER == "Y" ]]
		then
			git pull
			git push
			echo "Your commits have been pushed."
			read -p "Press ENTER to continue."
			clear
		else
			echo "Your commits have not been pushed."
			read -p "Press ENTER to continue."
			clear
		fi
	elif [ $(($OPTION)) -eq 8 ]
	then
		rm -f $SHA $SHA.asc

		echo "sha256sum $FILES > $SHA"
		sha256sum $FILES > $SHA

		echo "sha256sum -c $SHA"
		sha256sum -c $SHA

		echo "gpg -o $SHA.asc -a -sb $SHA"
		gpg -o $SHA.asc -a -sb $SHA

		echo "gpg --verify $SHA.asc $SHA"
		gpg --verify $SHA.asc $SHA

		read -p "Press ENTER to continue."
		clear
	else
		echo "Feature incoming..."
		read -p "Press ENTER to continue."
		clear
	fi

	echo "Choose one of the following options:"
	echo "[0] Exit"
	echo "[1] Add Log"
	echo "[2] Add Weekly Rank"
	echo "[3] Add Top 10 List"
	echo "[4] Commit Log"
	echo "[5] Commit Weekly Rank"
	echo "[6] Commit Top 10 List"
	echo "[7] Push all changes"
    echo "[8] Sign files"

	read -p "Enter your choice: " OPTION
	clear
done

exit 0
