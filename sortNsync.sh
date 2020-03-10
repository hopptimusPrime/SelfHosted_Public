#!/bin/bash

#  Abandon the SYNCING  ship!!      
#                                                     *
#
#                                                                 
#                    |       |%%|   |%%|  |%%|  |%%|      |                                    {$USER}.atLifeboat()      
#                    |       |  |   |  |  |  |  |  |      |                                   |  
#                    |     __|__|___|__|__|__|__|__|___   |                                   v  
#     ^         _____|_____|__________________________|___|___                                   
#    /  \  ^    \                                             )                            _0000000__  
#   /       \    \                                           /                    --->     \________/
# This bash script goes through specified directorys, finds new updated files and copys them to your specified remote directory
# Intially written by Ed Gockman. Sept 24 2019
#_______________________________________________________________________________________________________________________________________________
#
#         VERSONING                  AUT                   CHANGELOG                       DATE
#
#          2.0                       EDG                   Rebuild of initial script.      3-9-20
#_______________________________________________________________________________________________________________________________________________

#Start of Var Defs.
today=$(date "+%d-%m-%y")
folder1='Documents'
#End of Var defs

#Start of Methods
writeIndex()   #in Bash all methods must be defined above the point where theyre called
{
  echo 'here'

   echo $today >> FullArchiveIndex.txt 
   cat $today-archiveIndex.txt >> FullArchiveIndex.txt
}
cleanUp()
{
   mv $today-FArchive.zip ~/Test       #Test is the syncthing directory
   rm $today-archiveIndex.txt
}

optionalSort()
{
#   Optional sort of junk folders. Looks for common file extentions and moves them to their Home folders.
#   Uncomment the call to it if you wish to use it
#
copyCat    #TODO making it a method since i will pass in the junk directory to look in. EXA:  Downloads vs Home etc. right now its just home
}
copyCat()
{
   #Why the 2>/dev/null statements?  Cause mv throws an error if it has nothing to move. Just pipe that error (>2) into null to get rid of it.
    #Music
    mv *.mp3  ~/Music/Unsorted  2>/dev/null
    mv *.wav ~/Music/Unsorted  2>/dev/null
    #Movies and Vids
    mv *.mkv ~/Videos  2>/dev/null
    mv *.avi ~/Videos  2>/dev/null
    mv *.m4v ~/Videos  2>/dev/null
    mv *.flv ~/Videos  2>/dev/null
    #Images
    mv *.jpeg ~/Images/Unsorted  2>/dev/null
    #ISOs
    #installers
    #Docs
    mv *.pdf ~/Documents  2>/dev/null
    mv *.txt ~/Documents  2>/dev/null
    #Code
    #cp *.sh   ~/CODE/Bash      #TODO figure out how to avoid moving titanic.sh itself, for now we'll just copy. 
                                #What a royal messup that was. Test runs kept overlaying all my changes :-(
    mv *.py ~/CODE/Bash  2>/dev/null
    #
     
        
}
#End of Methods

# BEGIN MAIN METHOD --------------------------------------------------------
find $folder1 -mindepth 1 -mtime -1 >> $today-archiveIndex.txt

zip $today-FArchive.zip -@  < $today-archiveIndex.txt
optionalSort
writeIndex
cleanUp
# END MAIN METHOD-----------------------------------------------------------