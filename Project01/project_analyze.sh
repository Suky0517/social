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

if [ "$var" -eq 5 ] ; then
	echo "What do you want to do? Type 1 for Backup; type 2 for Restore"; read want
	if [ "$want" -eq 1 ] ; then
		if [ -d backup ] ; then
			rm ./backup/*
		else
			mkdir backup
		fi

		touch restore.log
		for file in `find -name *.tmp`
		do
			echo "$file" >> restore.log
			cp "$file" ./backup
			rm "$file"
		done
	fi

	if [ "$want" -eq 2 ] ; then
		if [ -f restore.log ] ; then
			while IFS= read -r line
			do
				cp -r backup 
			done < ./restore.log
		fi
	fi
fi

if [ "$var" -eq 4 ] ; then
	if [ ! -f permissions.log ] ; then
		touch permissions.log
	fi

	echo "What do you want to do? Type 1 for Change or type 2 for Restore"; read want
	if [ "$want" -eq 1 ] ; then
		if [ -f permissions.log ] ; then
			rm permissions.log
		else
			touch permissions.log
		fi

		find ./ -name "*.sh" -print0 | while IFS= read -d '' file
		do
			ls -l "$file" >> permissions.log
			ls -l "$file" | read str
			if [ ! "${str[3]}" = w ] ; then
				chmod u-x "$file"
			else
				chmod u+x "$file"
			fi
			if [ ! "${str[6]}" = w ] ; then
				chmod g-x "$file"
			else
				chmod g+x "$file"
			fi
			if [ ! "${str[9]}" = w ] ; then
				chmod o-x "$file"
			else
				chmod o+x "$file"
			fi
		done
	fi
	if [ "$want" -eq 2 ] ;then
		for i in `find ./ -name *.sh`
		do
			cat permissions.log | grep "$i" | read str
			if [ "${str[4]}" = x ] ; then
				chmod u+x "$i"
			else
				chmod u-x "$i"
			fi
			if [ "${str[7]}" = x ] ; then
				chmod g+x "$i"
			else
				chmod g-x "$i"
			fi
			if [ "${str[10]}" = x ] ; then
				chmod o+x "$i"
			else
				chmod o-x "$i"
			fi
		done
	fi
fi

if [ "$var" -eq 7 ] ; then
	echo "What word do you want to search?";read word
	echo "Do you want to search for files that were modified a certain time ago? If yes, type Y; else, type N";read time_bool
	if [ "$time_bool" = Y ] ; then
		echo "Enter the range of time and search among the files that were modified within that time";read search_time
	else
		let search_time=30
	fi
	echo "If you want to search all the lines in every file containingthe word enter 1";echo "If you want to search all the files whose name containing the word, neter 2";read search
	if [ -f search.txt ] ; then
		rm search.txt
	else
		touch search.txt
	fi
	if [ "$search" -eq 1 ] ; then
		find ./ -type f -mtime -"$search_time" -print0 | while IFS= read -d '' file
		do
			cat "$file" | grep "$word" >> search.txt
		done
	fi
	if [ "$search" -eq 2 ] ; then
		find ./ -type f -name "*$word*" -mtime -"$search_time" | while IFS= read -d '' file
		do
			ls -l "$file" >> search.txt
		done
	fi
fi

if [ "$var" -eq 6 ] ; then
	echo "Choose what you want to do"
	echo "Do you want to see the weather forecast for the following 3 days? input weather"
	echo "Do you want to use calculator here? input calculator"
	read usage
	if [ "$usage" = weather ] ; then
		echo "";echo "";curl wttr.in
	fi
	if [ "$usage" = calculator ] ; then
		want="Y"
		while [ "$want" = Y ]
		do
		echo "";echo "Type the equation: ";read math
		calc() { awk "BEGIN{print $*}"; }
		calc "$math"
		echo "Do you want to do calculation again? If yes, type Y; otherwise, type N";read want
		done
	fi
fi

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

if [ "$var" -eq 2 ] ; then
	find . -type f -exec ls -Shl {} +
fi

if [ "$var" -eq 3 ] ; then
	echo -n "Input an extension: "
	read extension
	find -name "*.$extension" -ls | wc -l
fi

