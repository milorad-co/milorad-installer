#!/bin/fish
rm -rfv (status -f)
echo -e "Creating the directory /bin/milorad/. This will require sudo permissions due to it being in /bin/."
sudo mkdir -vm a=rwx /bin/milorad
cd /bin/milorad
git clone https://github.com/milorad-co/milorad-installer
cd milorad-installer
rm -fv README.md
mv -fv milorad-installer.sh /bin/milorad/milorad-installer.sh
cd ..
rm -rfv milorad-installer
chmod -fv u+x milorad-installer.sh
function milorad -a subcmd target os
    mv -fv /bin/milorad/milorad.fish /home/$USER/.config/fish/functions/milorad.fish
end
funcsave milorad
echo -e "\nThe Milorad application installer has been set up. Run the command 'milorad help' for more details."
