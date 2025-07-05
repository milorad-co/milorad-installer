#!/bin/fish
sudo mkdir -pvm a=rwx /bin/milorad/
sudo chmod a+rwx /bin/milorad/
function milorad -a subcmd package
    set currentdir $PWD
    set ans "n"
    cd /bin/milorad/
    if test "$subcmd" != ""
        if test "$subcmd" = "install"
            if test "$package" != ""
                if test "$package" = "gump-win" -o "$package" = "gump-windows"
                    echo "Installing GUMP for Windows will take up 12mb of space. Install anyway? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        if test -e /bin/milorad/GUMP-Windows/
                            echo -e "GUMP for Windows is already installed\nDid you mean 'milorad update $package'?\nTry 'milorad help' for more information."
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
                if test "$package" = "gump-dev" -o "$package" = "gump-development"
                    echo "Sorry, the development build of GUMP is not available at the moment. It will be released in a few weeks."
                end
                if test "$package" = "gump-deb" -o "$package" = "gump-linux" -o "$package" = "gump"
                    echo "Sorry, the Linux build of GUMP is not available at the moment. Its release date is unknown."
                end
                if test "$package" != "gump-deb" -a "$package" != "gump-linux" -a "$package" != "gump" -a "$package" = "gump-dev" -a "$package" != "gump-development" -a "$package" != "gump-win" -a "$package" != "gump-windows"
                    echo -e "Invalid option: '$package'.\nTry 'milorad help' for more information."
                end
            else
                echo -e "Missing operand.\nTry 'milorad help' for more information"
            end
        end
        if test "$subcmd" = "update" -o "$subcmd" = "reinstall"
            if test "$package" != ""
                if test "$package" = "gump-win" -o "$package" = "gump-windows"
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
                        echo -e "GUMP for Windows is not installed\nDo you want to install it? [Y/n]"
                        read --prompt-str " > " ans
                        if test $ans = "Y" -o $ans = "y"
                            milorad install gump-win
                        end
                    end
                end
                if test "$package" = "gump-dev" -o "$package" = "gump-development"
                    echo -e "GUMP for developers is not installed\nDo you want to install it? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        milorad install gump-dev
                    end
                end
                if test "$package" = "gump-deb" -o "$package" = "gump-linux" -o "$package" = "gump"
                    echo -e "GUMP for Linux is not installed\nDo you want to install it? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        milorad install gump
                    end
                end
                if test "$package" != "gump-deb" -a "$package" != "gump-linux" -a "$package" != "gump" -a "$package" = "gump-dev" -o "$package" = "gump-development" -a "$package" = "gump-win" -a "$package" = "gump-windows"
                    echo -e "Invalid option: '$package'.\nTry 'milorad help' for more information."
                end
            else
                rm -rfv (status -f)
                sudo mkdir -vm a=rwx /bin/milorad
                cd /bin/milorad
                git clone https://github.com/milorad-co/milorad-installer
                cd milorad-installer
                rm -fv README.md
                mv -fv milorad-installer.sh /bin/milorad/milorad-installer.sh
                cd ..
                rm -rfv milorad-installer
                chmod -v u+x milorad-installer.sh
                echo -e "\nThe Milorad Application Installer has been updated."
            end
        end
        if test "$subcmd" = "remove"
            if test "$package" != ""
                if test "$package" = "gump" -o "$package" = "gump-deb" -o "$package" = "gump-linux"
                    echo "GUMP was not installed, so not removed."
                end
                if test "$package" = "gump-dev" -o "$package" = "gump-development"
                    echo "GUMP for development was not installed, so not removed."
                end
                if test "$package" = "gump-win" -o "$package" = "gump-windows"
                    if test -e /bin/miloradrm/GUMP-Windows/
                        rm -rfv /bin/milorad/GUMP-Windows/
                        echo -e "\nGUMP for Windows has been removed."
                    else
                        echo "GUMP for Windows was not installed, so not removed."
                    end
                end
            end
        end
        if test "$subcmd" = "help"
            echo "milorad-installer version 0
Usage: milorad <subcommand> <application>

milorad-installer is a commandline Milorad application manager and
provides commands for installing, removing, and updating all Milorad
appliations, such as GUMP.

Subcommands
help - display this help
install - install an application
remove - remove an installed application
update/reinstall - remove an installed application, or this installer
if no application name is provided, then install the latest version
of that application/installer
Applications
gump - a useless art program"
        end
        if test "$subcmd" != "install" -a "$subcmd" != "update" -a "$subcmd" != "remove" -a "$subcmd" != "help"
            echo -e "Invalid option: '$subcmd'.\nTry 'milorad help' for more information."
        end
    else
        echo -e "Missing operand.\nTry 'milorad help' for more information."
    end
    cd $currentdir
end
funcsave milorad
echo "The Milorad Application installer has been set up for $USER. All functions created by this installer will be created only for that user."
