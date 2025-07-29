# How to Install
## For Linux
For Debian-based Linux distros (such as Ubuntu, Linux Mint, MX Linux, Kali Linux, Pop!_OS, elementary OS, Zorin OS, Deepin, antiX, and KDE Neon), you can simply paste the following command block into your terminal:
```
git clone https://github.com/milorad-co/milorad-installer/
cd milorad-installer
chmod a+x milorad
sudo ./milorad
cd ..
rm -rfv milorad-installer
```
## For Windows
First, you must install [Git Bash for Windows](https://git-scm.com/downloads/win).<br>
Then, open Git Bash **as administrator**. Then run the following commands:
```
git clone https://github.com/milorad-co/milorad-installer/
cd milorad-installer
chmod a+x milorad
./milorad
cd ..
rm -rfv milorad-installer
```
## For MacOS
Milorad has not (and probably will never) make any applications for MacOS.
# Known Issues
1. ***When attempting to update the installer, a fatal error can occur causing /usr/bin (a directory vital to the functioning of Git Bash and Linux systems) to be deleted.***
2. Under certain circumstances the `Missing operand` error can appear when all required operands have been specified. This is purely visual and the command still runs correctly.
# Patches
Version 4 - Made windows fully compatible, but created a catastrophic issue that causes /usr/bin to be deleted.<br>
Version 3 - Reverted back to Bash for the final time.<br>
Version 2 - Converted installer once again to Fish due to the false belief that Fish could run on Windows. Also fixed some minor issues.<br>
Version 1 - Converted installer to Bash for Windows compatibility.<br>
Version 0 - Created the original installer, written in Fish.<br>
