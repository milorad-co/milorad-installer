#!/bin/fish
rm -rfv (status -f)
echo -e "Creating the directory /bin/milorad/. This will require sudo permissions due to it being in /bin/."
sudo mkdir -vm a=rwx /bin/milorad
cd /bin/milorad
git clone https://github.com/milorad-co/milorad-installer
cd milorad-installer
rm -fv README.md
chmod u+x milorad.sh
./milorad.sh
cd ..
rm -rfv milorad-installer
echo -e "\nThe Milorad application installer has been set up for $USER. Enter the command 'milorad help' for more details."
