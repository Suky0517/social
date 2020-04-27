# CS 1XA3 Project01 - <zhans174>

## Usage
This script should be executable, however, if it doesn't, enable this scipt to be executable by typing 
	chomod +x CS1XA3/Project01/project_analyze.sh

After that, use **./CS1XA3.Project/prject_analyze** to execute the script
It will display some insturctions for what argument does it need to implement some features
Different arugment will lead to their corresponding features, so be careful
Here are the list of all possible arguments 
1 
2 
3 
>Will be more here

## Feature 01 FIXME Log 
- Description: this feature find every file in my repo that has the word #FIXME in the last line
- Exucution: excute this feature by inputing argument 1 
- Reference: some code was taken from 
1. [ course_web ] (http://mac1xa3.ca)
2. [ stackoverflow ] (http://stackoverflow.com/questions/60217860)

## Feature 02 File Size List
- Description: this feature List the all files in the repo (directories exclusive) and their sized in a human readable form, in sorted order from the largest 
file to the smallest file
- Excution: excute this feature by inputing argument 2
- Reference: some code was taken from 
1. [ course_web ] (http://mac1xa3.ca)
2. [ stackexchange ] (http://unix.stackexchange.com/questions/53737)

## Feature 03 File Type Count
- Description: this feature use the read command (with a prompt), prompt the user for an extension and output the number of files in my repo with the extension
- Excution: excute this feature by input argument 3
- Reference: some code was taken from 
1. [ course_web ] (http://mac1xa3.ca)
2. [ git_book ]  (http://git-scm.com/book/zh/v2)

> **Feature 04** and ** feature 05** are to be implemented in part2

## Feature 06 Do something user friendly
- Description: this feature use the read command (with a prompt), prompt the user to use normal English word to see some infromation or do application, for 
example, weather forecast and use calculator
-- The user will be asked what function does it want
--- Weather forecast display the weather information for the next 3 days.
--- Calculator enable some simple calculation, also inform the user how to exit it.
- Excution: excute this feature by input argument 6
- Reference: some code was taken from
1. [ course_web ] (http://mac1xa3.ca)
> There probably will be more in the future

## Feature 07 Search for a word in file modified a certain time ago
- Description: this feature use the read command (with a prompt), prompt the user to choose whether to see all the lines in every file in the current directory 
and subdirectory containg a specific word or all the files whose name has a specific word
- First, ask the user to choose a word the user want to search and if the user want to search the files modified a certain time ago(By default, the time range is 30 days)
- Ask the user if it want to search all the context in every file containing the word OR every file whose name containg the word
-- If the user choose to see all the context, then write all the lines in all every files containing the word into serach.txt (overwrite it if ir already exist)
-- If the user choose to see all the file whose name containg the word, write all the files with their name, size, their path .etc into search.txt(overwrite it if it 
exists), make all the files executable if the user wants.
-- If the user want to see the serach file, show it.
- Excution: excute this feature by input argument 7
- Reference: some code was taken from
1. [ course_web ] (http://mac1xa3.ca)
> There probably will be more in the future.
