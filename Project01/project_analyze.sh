#!/bin/bash
echo "Enter the order of the instructor that you want to use"
echo "Operate 'FIXME log', input 1"
echo "Operate 'File Size List', input 2"
echo "Operate 'File Type Count', input 3"
echo "Operate 'Swtich to Executable', input 4"
echo "Operate 'Backup and Delete', input 5"
echo "Operate 'Do something user friendly', input 6"
echo "Operate 'Search for a word in file modified a certain time ago', input 7"
echo -n "Your choice is: "
read var

## feature Backup and Restore
if [ "$var" -eq 5 ] ; then
	## Ask the user to choose what to do
	echo "What do you want to do? Type 1 for Backup; type 2 for Restore"; read want
	## If the user choose to use Backup
	if [ "$want" -eq 1 ] ; then
		## if backup directory exist, empty it; else, make one
		if [ -d backup ] ; then
			touch ./backup/fill.txt
			rm ./backup/*
		else
			mkdir backup
		fi
		## touch a file restore.log if it doesn't exist, or overwrite it if it exist
		echo "" > restore.log
		## find all the files in repo recursively with an extension tmp
		for file in `find .. -name "*.tmp"`
		do
			## wite the file path to restore.log; copy it to backup; then remove it.
			echo "$file" >> restore.log
			cp "$file" ./backup
			rm "$file"
		done
	fi
	## If the user choose to restore files in backup
	if [ "$want" -eq 2 ] ; then
		## for files in backup directory
		for file in `find ./backup -type f`
		do
			## find all the files' name; get their original location; move them to their original location
			file_name=$(echo "$file" | cut -d'/' -f 3)
			location=`cat restore.log | grep "$file_name"`
			mv "$file" "$location"
		done
	fi
fi

## feature Switch to Executable
if [ "$var" -eq 4 ] ; then
	## Create a file if it doesn't exist
	if [ ! -f permissions.log ] ; then
		touch permissions.log
	fi
	## Ask the user what does he/she want to do
	echo "What do you want to do? Type 1 for Change or type 2 for Restore"; read want
	## If the user want to Change permissions
	if [ "$want" -eq 1 ] ; then
		## make sure that permissions.log exists and it's empty
		if [ -f permissions.log ] ; then
			rm permissions.log
		else
			touch permissions.log
		fi
		## find all shell scripts
		find .. -name "*.sh" -print0 | while IFS= read -d '' file
		do
			## list all the permissions of all the shell scripts to permissions.log
			ls -l "$file" >> permissions.log
			## Write the current file's permission to string.txt to use cut command
			ls -l "$file" > string.txt
			## mystr1 shows the permission of user to write or not
			mystr1=`cut -c3 string.txt`
			if [ "$mystr1" = w ] ; then
				chmod u+x "$file"
			else
				chmod u-x "$file"
			fi
			## mystr2 shows the permission of the group to write or not
			mystr2=`cut -c6 string.txt`
			if [ "$mystr2" = w ] ; then
				chmod g+x "$file"
			else
				chmod g-x "$file"
			fi
			## mystr3 shows the permission of others to write or not
			mystr3=`cut -c9 string.txt`
			if [ "$mystr3" = w ] ; then
				chmod o+x "$file"
			else
				chmod o-x "$file"
			fi
		done
		rm string.txt
	fi
	## If the user choose to Restore
	if [ "$want" -eq 2 ] ;then
		## for all the shell scripts in repo
		for file in `find .. -name "*.sh"`
		do
			## find the file's permission in permissions.log and write it to string2.txt
			cat permissions.log | grep "$file" > string2.txt
			## mystr4 shows the permission of the user to execute
			mystr4=`cut -c4 string2.txt`
			if [ "$mystr4" = x ] ; then
				chmod u+x "$file"
			else
				chmod u-x "$file"
			fi
			## mystr5 shows the permission of the group to execute
			mystr5=`cut -c7 string2.txt`
			if [ "$mystr5" = x ] ; then
				chmod g+x "$file"
			else
				chmod g-x "$file"
			fi
			## mystr6 shows the permission of others to executes
			mystr6=`cut -c10 string2.txt`
			if [ "$mystr6" = x ] ; then
				chmod o+x "$file"
			else
				chmod o-x "$file"
			fi
		done
		rm string2.txt
	fi
fi

## Customize feature 1
if [ "$var" -eq 7 ] ; then
	## Ask the user what word he/she want to search
	echo "What word do you want to search?";read word
	## Ask the user if he/she want to search for files modified in a certain time ago
	echo "Do you want to search for files that were modified a certain time ago? If yes, type Y; else, type N";read time_bool
	if [ "$time_bool" = Y ] ; then
		echo "Enter the range of time in terms of days and search among the files that were modified within that time";read search_time
	else
		## By default, the search time is 30 days
		let search_time=30
	fi
	## Ask the user to choose search word in context or by file name
	echo "If you want to search all the lines in every file containingthe word enter 1"
	echo "If you want to search all the files whose name containing the word, neter 2"
	read search
	## Make sure that search.txt exists and it's empty
	if [ -f search.txt ] ; then
		rm search.txt
	else
		touch search.txt
	fi
	## search all the files in the current directory by their context
	if [ "$search" -eq 1 ] ; then
		find ./ -type f -mtime -"$search_time" -print0 | while IFS= read -d '' file
		do
			## Find all the files' context and grab all the lines containing the search_word and write the lines to search.txt
			cat "$file" | grep "$word" >> search.txt
		done
	fi
	## search all the files in the current directory by their name
	if [ "$search" -eq 2 ] ; then
		find ./ -type f -name "*$word*" -mtime -"$search_time" -print0 | while IFS= read -d '' file
		do
			## write all the files with their permissions size into search.txt
			ls -l "$file" >> search.txt
		done
	fi
	## Ask the user if he/she want to see the context of search.txt
	echo "Do you want to see the contest in search.txt? Type Y for yes and N for N"
	read show
	if [ "$show" = Y ] ; then
		cat search.txt
	fi
fi

## If the user want to do something funny
if [ "$var" -eq 6 ] ; then
	## Ask the user what does he want to do
	echo "Choose what you want to do"
	echo "Do you want to see the weather forecast for the following 3 days? input weather"
	echo "Do you want to use calculator here? input calculator"
	read usage
	## If the user want to see the weather for the following 3 days
	if [ "$usage" = weather ] ; then
		## Show the weather for the following 3 days
		echo "";echo "";curl wttr.in
	fi
	if [ "$usage" = calculator ] ; then
		## do a while loop so that the user can use calculator many times
		want="Y"
		while [ "$want" = Y ]
		do
		## Ask the user to type an equation
		echo "";echo "Type a binary equation: ";read math
		calc() { awk "BEGIN{print $*}"; }
		## Use the calculator
		calc "$math"
		echo "Do you want to do calculation again? If yes, type Y; otherwise, type N";read want
		done
	fi
fi

## feature FIXME
if [ "$var" -eq 1 ] ; then
	if [ -f fixme.log ]; then
		rm fixme.log
	fi
	touch fixme.log
	find -type f -print0 | while IFS= read -rd '' file;
	do
	tail -n 1 "$file" | grep -q FIXME && echo "$file" >> fixme.log
	done
fi

## feature File Size List
if [ "$var" -eq 2 ] ; then
	find . -type f -exec ls -Shl {} +
fi

## feature File Type Count
if [ "$var" -eq 3 ] ; then
	echo -n "Input an extension: "
	read extension
	find -name "*.$extension" -ls | wc -l
fi

