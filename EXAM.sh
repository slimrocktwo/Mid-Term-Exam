#!/bin/bash

## Created by Steve Langewicz
## Mid Term Exam 10-27-2016

declare -A homeDir
declare -i repeatQ=1
declare -i TRUE=1
declare -A userPrompt
main() {
       askHomeDir
       lsLDesc
       pathNames
       createFile
       clobFinder
       moveFile
       exit 0;
}

askHomeDir() {
        homeDir=$HOME
        if [ $repeatQ == $TRUE ]
        then
                read -p "Please enter the absolute path for your home directory: " userPrompt
                if [ "$userPrompt" = "$homeDir" ]
                then
                        echo -e "\nCorrect!\n\n\n\n\n\n"
                        repeatQ=0
                        sleep 1
                else

                        echo -e "\nIncorrect, try again!\n"
                        askHomeDir
                fi
        fi
}

lsLDesc() {
        clear
        ls -l | grep EXAM.sh
        echo -e "\n\nThis is the output of ls -l, focusing on EXAM.sh.\n\n
The first character listed (-) is the type of file.\n The File Access Permissons are next (rwx---r--). r stands for Read, w for Write, and x for Execute. \nThere are 9 options total, allowing for three
seperate groups.\n
The first set is Owner permissions. The Second set is Group permissions. And third is Others.\n
The number 1 represents the amount of links made to the file.\n
Next is the owners name (slangewicz) followed by group name (slangewicz)\n
499 is the size of the file in bytes. Next is the date and time of modification (Oct 27 22:00).\n
Last is the name of the file (EXAM.sh)\n\n\n\n"
        sleep 15
}

pathNames() {
        clear
        echo -e "Absoltue file paths are the direct path to a directory from root.
For example, the absolute file path to the MidTerm folder would look like:\n\n/home/slangewicz/MidTerm\n\n\n
A Relative pathname would base part of the pathway on your current location. For example, changing to MidTerm from
my home directory folder (slangewicz) would look like:\n\n cd ./MidTerm.\n\n\n"
        sleep 8
}

createFile() {
        echo -e "\n\nCreating file DeLeTe.Me in home directory..\n\n"
        cd /home/slangewicz/
        touch DeLeTe.Me
}

#fillFile() {

#readFile() {

clobFinder() {
        echo -e "Searching for all files with 'clob'.. in the home directory"
        grep -r "clob" /home/slangewicz
        sleep 2
}

moveFile() {
        echo "Moving EXAM.sh to Home Dir; Deleting DeLeTe.Me from Home dir."
        cd /home/slangewicz/MidTerm
        mv EXAM.sh /home/slangewicz
        cd /home/slangewicz
        rm DeLeTe.Me
}








main
