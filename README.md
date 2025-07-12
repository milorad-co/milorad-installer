# milorad-installer
A fish script which can quickly install any Milorad application and create functions to start them.
# How to install
For Linux:
NOTE: Most Milorad applications are intended to run on Debian Linux, so only Debian-based distros will work properly.
1. Intall FISH.
   Most users of Linux won't have FISH (the Friendly Interactive SHell) installed. To install it, enter this command into your terminal:
```
sudo apt install fish
```
3. Install the installer.
   Paste the following commands into your terminal and press enter:
```
git clone https://github.com/milorad-co/milorad-installer/
cd milorad-installer/
chmod +x milorad.sh
./milorad.sh
cd ..
rm -r milorad-installer/
```
Then you're done.
