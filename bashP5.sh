#!/bin/bash

#text box prompting user to enter name of traveler
passengerName=$(zenity --entry --title="New Reservation" --text="Enter name of traveler:")
#selection box with list of possible departure cities
departCity=$(zenity  --list  --text "What is your departure city?" --radiolist  --column "Pick" --column "City" TRUE "Portland,Oregon" FALSE "Seattle, Washington" FALSE "Boise, Idaho" FALSE "Bend, Oregon" FALSE "Santa Fe, New Mexico" FALSE "Kansas City, Kansas" FALSE "Glacier Park, Montana" FALSE "Florence, Italy" FALSE "Hibbing, Minnesota" FALSE "Bourbon, Missouri" FALSE "Phoenix, Arizona" FALSE "New Orleans, Louisiana" FALSE "Bedrule, Scotland" FALSE "Markow, Poland" FALSE "Dubrovnik, Croatia" )
#selection box with list of possible destination cities
destinationCity=$(zenity  --list  --text "Where do you wish to travel?" --radiolist  --column "Pick" --column "City" TRUE "Florence, Italy" FALSE Neverland FALSE "Hibbing, Minnesota" FALSE "Bourbon, Missouri" FALSE "Phoenix, Arizona" FALSE "New Orleans, Louisiana" FALSE "Bedrule, Scotland" FALSE "Markow, Poland" FALSE "Dubrovnik, Croatia" FALSE "Portland,Oregon" FALSE "Seattle, Washington" FALSE "Boise, Idaho" FALSE "Bend, Oregon" FALSE "Santa Fe, New Mexico" FALSE "Kansas City, Kansas" FALSE "Glacier Park, Montana")

#This loop checks to see if the passenger's name is already in the "database" (reservations.txt file)
#If so, then the line with the that passenger's reservation is removed from the file.
#The passenger gets a dialog box informing her that her last reservation has been removed
#Then the passenger is again prompted for her name, which will be added to the file as new later in the program
#It removes the name by moving the contents of reservations.txt into a new file called reservations
#and then the contents of reservations minus the line with the passenger's name is moved back to reservations.txt

#If the passenger's name is not found in reservations.txt, then nothing else happens in this loop
if grep -q "$passengerName" reservations.txt; then
    grep -v "$passengerName" reservations.txt > reservations; mv reservations reservations.txt
    zenity --info --title "ALERT" --text "Hello, $passengerName. Your previous reservation in the system has been canceled. Please begin again."
    passengerName=$(zenity --forms --title="New Reservation" --text="Personal Info" --add-entry="Enter Your Name")
fi

#pop up calendar to select departure date
departDate=$(zenity --calendar --title="Departure Date" --text="When do you wish to depart?")

#This loop runs when the destination city is "Neverland"
# If the user confirms the destination when the warning dialog pops up
#then they're prompted to enter the departure date and break out of the loop
# They are not prompted for a return date since there are no flights out of Neverland
#and the return date entered into the database is "when you're ready to grow up"

#If the passenger changes his mind and doesn't want to go to Neverland after Absolutely
#he is prompted to enter a new destination.

### Bug for Jessi to fix: It doesn't show the calendar prompts if "nevermind Neverland"

while [[ $destinationCity = "Neverland" ]]; do
#if "destinationCity" equals "Neverland" then pop up warning dialog and continue from there
    zenity --question --text "Are you sure you want to go to Neverland? This action cannot be reversed." --ok-label "Absolutely!" --cancel-label="No Way!"
        if [ $? = 0 ] ; then  #If the user hits "Absolutely"
            returnDate="When you're ready to grow up"
            break;
        elif [ $? = 1 ] ; then  #If the user hits "No Way"
            destinationCity=$(zenity  --list  --text "Where do you wish to travel?" --radiolist  --column "Pick" --column "City" TRUE "Florence, Italy" FALSE "Hibbing, Minnesota" FALSE "Bourbon, Missouri" FALSE "Phoenix, Arizona" FALSE "New Orleans, Louisiana" FALSE "Bedrule, Scotland" FALSE "Markow, Poland" FALSE "Dubrovnik, Croatia" FALSE "Portland,Oregon" FALSE "Seattle, Washington" FALSE "Boise, Idaho" FALSE "Bend, Oregon" FALSE "Santa Fe, New Mexico" FALSE "Kansas City, Kansas" FALSE "Glacier Park, Montana")
            returnDate=$(zenity --calendar --title="Return Date" --text="When do you wish to return?")
            break;
        fi
done

#If the destination city is any other than "Neverland", prompt for return date
while [[ $destinationCity != "Neverland" ]]; do
    #pop up calendar to select return date
    returnDate=$(zenity --calendar --title="Return Date" --text="When do you wish to return?")
    break;
done

#text box prompting user to enter how many bags they are bringing
howmanyBags=$(zenity --entry --title="Baggage Count" --text="How many bags are you bringing:")

# Print the reservation info to the terminal
echo Your Reservation Info:
echo " " #blank line for style
echo Name: $passengerName
echo Departure City: $departCity
echo Departure Date: $departDate
echo destination City: $destinationCity
echo Number of Bags: $howmanyBags
echo Return Date: $returnDate
echo " " #blank line for style

# Print the reservation info to the reservations.txt file
echo "$passengerName|$departCity|$destinationCity|$departDate|$returnDate|$howmanyBags" >> reservations.txt
