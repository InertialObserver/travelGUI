#!/bin/bash

#text box prompting user to enter name of traveler
passengerName=$(zenity --entry --title="New Reservation" --text="Enter name of traveler:")

#selection box with list of possible departure cities
departCity=$(zenity --list --text="What is your departure city?" --radiolist --column"Pick" --column"City" --text=TRUE "Portland,Oregon" FALSE "Seattle, Washington", FALSE "Boise, Idaho",FALSE "Bend, Oregon",FALSE "Santa Fe, New Mexico",FALSE "Kansas City, Kansas",FALSE "Glacier Park, Montana")

#selection box with list of possible destination cities
destinationCity=$(zenity --list --text="Where do you wish to travel?" --radiolist --column"Pick" --column"City" --text=TRUE "Florence, Italy",FALSE Neverland FALSE "Hibbing, Minnesota",FALSE "Bourbon, Missouri",FALSE "Phoenix, Arizona",FALSE "New Orleans, Louisiana",FALSE "Bedrule, Scotland",FALSE "Markow, Poland",FALSE "Dubrovnik, Croatia")

#pop up calendar to select departure date
departDate=$(zenity --calendar --title="Departure Date" --text="When do you wish to depart?") 

#pop up calendar to select return date
returnDate=$(zenity --calendar --title="Return Date" --text="When do you wish to return?")

#text box prompting user to enter how many bags they are bringing
howmanybags=$(zenity --entry --title="Baggage Count" --text="How many bags are you bringing:")


