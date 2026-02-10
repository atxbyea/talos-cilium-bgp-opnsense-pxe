Here are all the bits needed to get the netbootxyz bits running, does not include setting up netbootxyz, those will come later

### Menus ###
Contains the needed boot entries to do a check to see if any file exists that matches the MAC address of the nodes
Then chainloads the correct image (either wipe or unattended) to deploy the systems
Which tells the server to fetch assets from the webserver


### Assets ###
Contains the assets needed to boot the kernel etc, also a script to pull any updates down the line
