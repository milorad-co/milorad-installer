# milorad-installer
A fish script which can quickly install any Milorad application and create functions to start them.
# How to install
For Debian-based Linux Distros (such as Ubuntu, Linux Mint, MX Linux, Kali Linux, Deepin, Pop!_OS, Zorin OS, antiX, Devuan, KDE Neon, and more):
1. Intall FISH.
   Most users of Linux won't have FISH (the Friendly Interactive SHell) installed. To install it, enter this command into your terminal:
```
sudo apt install fish
```
2. Install the installer.
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
