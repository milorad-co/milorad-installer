# Milorad Application Installer
A fish script which can quickly install any Milorad application and create functions to start them.

This script uses the `git` command to install applications in the directory /opt/milorad/ (on Linux) or C:/Program Files/Git/opt/milorad/ (on Windows), then creates functions to easily start them from the terminal! The applications it can install are:
1. GUMP - The GNU Useless Manipulation Program, for Windows, Linux, and development.

Many more apps are currently in development. The full list of them is on the [Milorad Website](https://milorad-co.github.io/).
# How to install
## For Linux
This script requires Fish and Git to be installed. They can be installed together with `sudo apt install fish git`.<br>
For Debian-based Linux distros (such as Ubuntu, Linux Mint, MX Linux, Kali Linux, Deepin, Pop!_OS, Zorin OS, antiX, Devuan, KDE Neon, and more), paste the following command block into your terminal and press enter (there is no need to download the milorad.sh file):
```
git clone https://github.com/milorad-co/mai-setup/
cd mai-setup/
chmod +x milorad-setup.sh
./milorad-setup.sh
cd ..
rm -r milorad-installer/
```

This method works for non-Debian based Linux distros (such as Fedora, openSUSE, Gentoo, and Arch), but there will be some glitches with the applications the installer installs.
## For Windows
1. [Install Git Bash for Windows](https://git-scm.com/downloads/win).
2. Start Git Bash and run `pacman -S fish tmux`.
3. Enter the above code block.
## For MacOS
Milorad has not and will never make any applications for MacOS.
