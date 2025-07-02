#!/bin/fish
if test -e /bin/milorad/
else
    rm -rfv (status -f)
    echo -e "The directory /bin/milorad/ does not exist. Creating it now. This will require sudo permissions due to it being in /bin."
    sudo mkdir -vm a=rwx /bin/milorad
    cd /bin/milorad
    git clone https://github.com/milorad-co/milorad-installer
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
    exit
end
set ans "n"
cd /bin/milorad/
if set -q argv[1]
    if test "$argv[1]" = "install"
        if test -q argv[2]
            if test "$argv[2]" = "gump"
                if test "$argv[3]" = "win" -o "$argv[3]" = "windows"
                    echo "Installing GUMP for Windows will take up 12mb of space. Install anyway? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        if test -e /bin/milorad/GUMP-Windows/
                            echo -e "milorad update gump $argv[3]: GUMP for Windows is already installed\nDid you mean 'milorad update gump $argv[3]'?\nTry 'milorad help' for more information."
                        else
                            git clone https://github.com/milorad-co/GNU-Useless-Manipulation-Program
                            cd GNU-Useless-Manipulation-Program/
                            rm -rfv Linux/
                            rm -rfv Development/
                            mv -v Windows/ /bin/milorad/GUMP-Windows/
                            cd /bin/milorad
                            rm -rfv GNU-Useless-Manipulation-Program
                            function gump-win
                                wine /bin/milorad/GUMP-Windows/GUMP.exe
                            end
                            funcsave gump-win
                            echo -e "\nThe GNU Useless Manipulation Program for Windows has been installed.\nIt can be found in the directory /bin/milorad/, but can also be started by entering the command 'gump-win', asumming that you have WINE installed."
                            set ans 0
                        end
                    end
                end
                if test "$argv[3]" = "dev" -o "$argv[3]" = "development"
                    echo "Sorry, the development build of GUMP is not available at the moment. It will be released in a few weeks."
                end
                if test "$argv[3]" = "deb" -o "$argv[3]" = "linux" -o "$argv[3]" = ""
                    echo "Sorry, the Linux build of GUMP is not available at the moment. Its release date is unknown."
                end
                if test "$argv[3]" != "deb" -o "$argv[3]" != "linux" -o "$argv[3]" != "" -o "$argv[3]" = "dev" -o "$argv[3]" = "development" -o "$argv[3]" = "win" -o "$argv[3]" = "windows"
                    echo -e "milorad install gump: invalid option -- '$argv[3]'\nTry 'milorad help' for more information."
                end
            end
            if test "$argv[2]" != "gump"
                echo -e "milorad install: invalid option -- '$argv[2]'\nTry 'milorad help' for more information."
            end
        else
            echo -e "milorad install: missing operand\nTry 'milorad help' for more information"
        end
    end
    if test "$argv[1]" = "update" -o "$argv[1]" = "reinstall"
        if test -q argv[2]
            if test "$argv[2]" -eq "gump"
                if test "$argv[3]" = "win" -o "$argv[3]" = "windows"
                    if test -e /bin/milorad/GUMP-Windows/
                        rm -rfv /bin/milorad/GUMP-Windows/
                        git clone https://github.com/milorad-co/GNU-Useless-Manipulation-Program
                        cd GNU-Useless-Manipulation-Program
                        rm -rfv Linux/
                        rm -rfv Development/
                        mv -v Windows/ /bin/milorad/GUMP-Windows/
                        cd /bin/milorad
                        rm -rfv GNU-Useless-Manipulation-Program
                        function gump-win
                            wine /bin/milorad/GUMP-Windows-Stable/GUMP.exe
                        end
                        funcsave gump-win
                        echo -e "\nThe GNU Useless Manipulation Program for Windows has been updated."
                    else
                        echo "milorad update gump $argv[3]: GUMP for Windows is not installed\nDo you want to install it? [Y/n]"
                        read --prompt-str " > " ans
                        if test $ans = "Y" -o $ans = "y"
                            milorad install gump win
                        end
                    end
                end
                if test "$argv[3]" = "dev" -o "$argv[3]" = "development"
                    echo "milorad update gump $argv[3]: GUMP for developers is not installed\nDo you want to install it? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        milorad install gump dev
                    end
                end
                if test "$argv[3]" = "deb" -o "$argv[3]" = "linux"
                    echo "milorad update gump $argv[3]: GUMP for Linux is not installed\nDo you want to install it? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        milorad install gump
                    end
                end
                if test "$argv[3]" = ""
                    echo "milorad update gump: GUMP (for Linux) is not installed\nDo you want to install it? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        milorad install gump
                    end
                end
                if test "$argv[3]" != "deb" -o "$argv[3]" != "linux" -o "$argv[3]" != "" -o "$argv[3]" = "dev" -o "$argv[3]" = "development" -o "$argv[3]" = "win" -o "$argv[3]" = "windows"
                    echo -e "milorad update gump: invalid option -- '$argv[3]'\nTry 'milorad help' for more information."
                end
            end
        else
            echo -e "milorad update: missing operand\nDid you mean 'milorad update-all'?\nTry 'milorad help' for more information."
        end
    end
    if test "$argv[1]" = "installer"
        git clone https://github.com/milorad-co/milorad-installer
        rm -rfv milorad-installer.sh
        cd milorad-installer
        rm -fv README.md
        mv -v milorad-installer.sh /bin/milorad/milorad-installer.sh
        cd ..
        rm -rfv milorad-installer
        chmod -v u+x milorad-installer.sh
        echo -e "\nThe Milorad application installer has been updated! It can be found in /bin/milorad/, but can also be started by entering the command 'milorad'."
    end
    if test "$argv[1]" = "remove"
        if set -q "$argv"
            if test "$argv[2]" = "gump"
                echo "me no be bothered"
            end
        end
    end
    if test "$argv[1]" = "help"
        echo "me no be bothered"
    end
    if test "$argv[1]" != "install" -a "$argv[1]" != "update" -a "$argv[1]" != "remove" -a "$argv[1]" != "help"
        echo -e "milorad: invalid option -- '$argv[1]'\nTry 'milorad help' for more information."
    end
else
    echo -e "milorad: missing operand\nTry 'milorad help' for more information."
end
