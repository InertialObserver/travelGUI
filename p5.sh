#!/bin/bash

#Create a dialog box to ask for the traveler's name
passengerName=$(zenity --forms --title="Create Reservation" --text="Personal Info" --add-entry="Enter Your Name")
if grep -q "$passengerName" reservations.txt; then
    grep -v "$passengerName" reservations.txt > reservations; mv reservations reservations.txt
    zenity --info --title "ALERT" --text "Hello, $passengerName. Your previous reservation in the system has been canceled. Please begin again."
    passengerName=$(zenity --forms --title="New Reservation" --text="Personal Info" --add-entry="Enter Your Name")
fi
departCity=$(zenity  --list  --text "Choose Your Departure City" --radiolist  --column "Pick" --column "City" TRUE "Portland, OR" FALSE "Seattle, WA" FALSE "Los Angeles, CA" FALSE "Austin, TX" FALSE "Bozeman, MT" FALSE "Berlin, DE" FALSE "Sydney, AU" )
#echo $departCity #confirming departure city for testing
destinationCity=$(zenity  --list  --text "Choose Your destination City" --radiolist  --column "Pick" --column "City" TRUE "Portland, OR" FALSE "Seattle, WA" FALSE "Los Angeles, CA" FALSE "Austin, TX" FALSE "Bozeman, MT" FALSE "Berlin, DE" FALSE "Sydney, AU" FALSE Neverland )
#echo $destinationCity #confirming destination city for testing

while [[ $destinationCity = "Neverland" ]]; do
#if "destinationCity" equals "Neverland" then pop up warning dialog
    zenity --question --text "Are you sure you want to go to Neverland? This action cannot be reversed." --ok-label "Absolutely!" --cancel-label="No Way!"
        if [ $? = 0 ] ; then
            break;
        elif [ $? = 1 ] ; then
            destinationCity=$(zenity  --list  --text "Choose Your destination City" --radiolist  --column "Pick" --column "City" TRUE "Portland, OR" FALSE "Seattle, WA" FALSE "Los Angeles, CA" FALSE "Austin, TX" FALSE "Bozeman, MT" FALSE "Berlin, DE" FALSE "Sydney, AU" )
            break;
        fi
done
echo $destinationCity #confirming destination city for testing

departDate=$(zenity --calendar --text "When to leave?" --title "Initial Flight")
echo $departDate  #confirmting destination date for testing

returnDate=$(zenity --calendar --text "When to return?" --title "Return Flight")
echo $returnDate  #confirming return date for testing

howmanyBags=$(zenity --entry --text "How many bags are you taking along?")
#echo $howmanyBags #confirming number of bags for testing

echo Your Reservation Info:
echo " "
echo Name: $passengerName
echo Departure City: $departCity
echo Departure Date: $departDate
echo destination City: $destinationCity
echo Number of Bags: $howmanyBags
echo Return Date: $returnDate
echo "$passengerName|$departCity|$destinationCity|$departDate|$returnDate|$howmanyBags" >> reservations.txt

#if grep -q "$passengerName" reservations.txt; then
#    grep -v "$passengerName" reservations.txt > reservations; mv reservations reservations.txt
#fi
