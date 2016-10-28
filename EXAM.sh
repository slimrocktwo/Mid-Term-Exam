
#!/bin/bash

IFS=$','

## Created by Steve Langewicz
## Mid Term Exam 10-27-2016

##See CreateExam.sh for creation of EXAM.sh and MidTerm Directory using VI

declare -i MAX_ARRAY=2 #3 arrays
declare -i index
declare -A homeDir
declare -i repeatQ=1
declare -i TRUE=1
declare -A userPrompt
declare -a FILLEDARRAY[0]='umask 110'
declare -a FILLEDARRAY[1]="alias cls='clear'"
declare -a FILLEDARRAY[2]='set -o noclobber'
declare -a readArray

main() {
        askHomeDir
        lsLDesc
        pathNames
        createFile
        fillFile
#       readFile        #Ran out of time to get working properly
        sendToProfile
        clobFinder
        moveFile
        clear
        echo -e "\n\n\n\n\n\n\n\n\n\n Complete!"
        sleep 3
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
        clear
        echo -e "\n\nCreating file DeLeTe.Me in home directory..\n\n"
        cd /home/slangewicz/
        touch DeLeTe.Me
        sleep 3
}

fillFile() {
        echo -e "\n\n\n\nFilling DeLeTe.Me File.."
        cd /home/slangewicz
        for (( i=0; i <= $MAX_ARRAY; i++ )){
                echo "${FILLEDARRAY[i]}," >> DeLeTe.Me
                echo ${FILLEDARRAY[i]}
        sleep 2
        }
}

#readFile() {           #Ran out of time to get working properly
#       declare -i lineNumber=0
#       while read readArray
#       do
#               readArray[lineNumber]= ${readArray[lineNumber]}
#               echo -n ${readArray[lineNumber]}
#               ((lineNumber++))
#       done < DeLeTe.Me
#
#}

sendToProfile(){
        echo -e "\n\n\n\n Sending info to .bash_profile.."
        cd /home/slangewicz
        for (( i=0; i <= $MAX_ARRAY; i++ )){
                echo -e  "${FILLEDARRAY[i]}\n" >> .bash_profile
        }
        sleep 2
}

clobFinder() {
        clear
        echo -e "\n\n\nSearching for all files with 'clob'.. in the home directory\n\n"
        grep -r "clob" /home/slangewicz
        sleep 2
}

moveFile() {
        clear
        echo -e  "Moving EXAM.sh to Home Dir.\n Deleting DeLeTe.Me from Home dir.\n Deleting MidTermDir"
        cd /home/slangewicz/MidTerm
        mv EXAM.sh /home/slangewicz
        cd /home/slangewicz
        rm DeLeTe.Me
        rm -r MidTerm
}

main
