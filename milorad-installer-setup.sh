#!/bin/fish
if test -e /bin/milorad/
else
    echo -e "The directory /bin/milorad/ does not exist. Creating it now. This will require sudo permissions due to it being in /bin."
    sudo mkdir -vm a=rwx milorad
end
cd /bin/milorad
git clone https://github.com/milorad-co/milorad-installer
rm -rfv milorad-installer.sh
cd milorad-installer
rm -fv README.md
mv -v milorad-installer.sh /bin/milorad/milorad-installer.sh
cd ..
rm -rfv milorad-installer
chmod -v u+x milorad-installer.sh
function milorad -a subcmd target os
    /bin/milorad/milorad-installer.sh $subcmd $package $os
end
funcsave milorad
echo -e "\nThe Milorad application installer has been set up! It can be found in /bin/milorad/, but can also be started by entering the command 'milorad'."
