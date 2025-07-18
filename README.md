# Milorad Application Installer
A shell script which can quickly install any Milorad application and create functions to start them.

This script uses the `git` command to install applications in the directory /opt/milorad/ (on Linux) or C:\Program Files\milorad\ (on Windows), then creates functions to easily start them from the terminal! The applications it can install are:
1. GUMP - The GNU Useless Manipulation Program, for Windows, Linux, and development.

Many more apps are currently in development.
# How to install
## For Debian-based Linux Distros:
For Debian-based Linux distros (such as Ubuntu, Linux Mint, MX Linux, Kali Linux, Deepin, Pop!_OS, Zorin OS, antiX, Devuan, KDE Neon, and more), paste the following command block into your terminal and press enter (there is no need to download the milorad.sh file):
```
git clone https://github.com/milorad-co/milorad-installer/
cd milorad-installer/
chmod +x milorad.sh
./milorad.sh
cd ..
rm -r milorad-installer/
```
This script requires Bash to be installed, however, Bash is built in to almost all Linux distros, so you usually do not need to worry about that.

This method works for non-Debian based Linux distros (such as Fedora, openSUSE, Gentoo, and Arch), but there will be some glitches with the applications the installer installs.
