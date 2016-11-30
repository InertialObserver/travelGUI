#{Bash Script : Travel Reservation GUI using Zenity}
This is a bash script that prompts the user via graphic pop-up boxes to enter their travel reservation information. The GUI is coded with Zenity.
#### Side Effects:
  -Only runs on local systems with Zenity installed
  -Will not run on systems accessed via SSH
#### KNOWN BUGS/ERRORS:
  -Allows behavior that should not be permitted, such as selecting a return date that is before the selected departure date.
## Installation
  -Install Zenity
  -If using a Windows computer, you need to run this program either with Cygwin or a Linux virtual box.
  -Clone git repo
## Usage
  -Navigate to the travelGUI directory via your terminal `cd travelGUI`
  -Type `bash bashP5.sh`
## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## History
This program is an assigned project for CSE 224 (Programming Tools)
## Credits
Written by: Corinna Dollar & Jessi Iler

29 Nov 2016

inertial.observer@gmail.com
## License
MIT License, Copyright 2016
