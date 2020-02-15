#!/bin/bash
echo "Enter the order of the instructor that you want to use"
echo "Operate 'FIXME log', input 1"
echo "Operate 'File Size List', input 2"
echo "Operate 'File Type Count', input 3"
echo -n "Your choice is: "
read var

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
