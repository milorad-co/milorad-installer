#!/bin/fish
function milorad -a subcmd package
    set ans "n"
    cd /bin/milorad/
    if set -q subcmd
        if test "$subcmd" = "install"
            echo $package
            if set -q package
                if test "$package" = "gump-win"
                    echo "Installing GUMP for Windows will take up 12mb of space. Install anyway? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        if test -e /bin/milorad/GUMP-Windows/
                            echo -e "GUMP for Windows is already installed.\nDid you mean 'milorad update gump' or 'milorad reinstall gump'?\nTry 'milorad help' for more information."
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
                if test "$package" = "gump-dev"
                        echo "Sorry, the development build of GUMP is not available at the moment. It will be released in a few weeks."
                end
                if test "$package" = "gump"
                    echo "Sorry, the Linux build of GUMP is not available at the moment. Its release date is unknown.\nTry 'milorad install gump-win'."
                end
                if test "$package" != "gump" -a "$package" != "gump-win" -a "$package" != "" -a "$package" = "gump-dev"
                    echo -e "Invalid option: '$package'.\nTry 'milorad help' for more information."
                end
            else
                echo -e "Missing operand.\nTry 'milorad help' for more information"
            end
        end
        if test "$subcmd" = "update" -o "$subcmd" = "reinstall"
            if set -q package
                if test "$package" -eq "gump-win"
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
                        echo "GUMP for Windows is not installed.\nDo you want to install it? [Y/n]"
                        read --prompt-str " > " ans
                        if test $ans = "Y" -o $ans = "y"
                            milorad install gump win
                        end
                    end
                end
                if test "$package" = "gump-dev"
                    echo "GUMP for developers is not installed.\nDo you want to install it? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        milorad install gump dev
                    end
                end
                if test "$package" = "gump"
                    echo "GUMP for Linux is not installed.\nDo you want to install it? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        milorad install gump
                    end
                end
                if test "$package" != "gump" -a "$package" != "gump-win" -a "$package" != "gump-dev"
                    echo -e "Invalid option -- '$package'\nTry 'milorad help' for more information."
                end
            else
                rm -fv (status -f)
                rm -fv milorad.sh
                echo -e "Creating the directory /bin/milorad/.\nThis will require sudo permissions due to it being in /bin/."
                sudo mkdir -fvm a=rwx /bin/milorad/
                mkdir -fvm a=rwx /bin/milorad/functions/
                cd /bin/milorad
                git clone https://github.com/milorad-co/milorad-installer
                cd milorad-installer
                rm -fv README.md
                chmod u+x milorad.sh
                ./milorad.sh
                cd ..
                rm -rfv milorad-installer
                echo -e "\nThe Milorad application installer has been set up for $USER.\nEnter the command 'milorad help' for more details."
            end
        end
        if test "$subcmd" = "remove"
            if set -q "$argv"
                if test "$package" = "gump"
                    rm -rfv /bin/milorad/GUMP
                end
                if test "$package" = "gump-win"
                    rm -rfv /bin/milorad/GUMP-Windows
                end
                if test "$package" = "gump-dev"
                    rm -rfv /bin/milorad/GUMP-Development
                end
                if test "$package" != "gump" -a "$package" != "gump-win" -a "$package" != "gump-dev"
                    echo -e "Invalid option: '$package'.\nTry the command 'milorad help' for more details."
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
help               display this help
install            install an application
remove             remove an installed application
update/reinstall   remove an installed application, or this installer
                   if no application name is provided, then install
                   the latest version of that application/installer
Applications
gump               a useless art program"
        end
        if test "$subcmd" != "install" -a "$subcmd" != "update" -a "$subcmd" != "remove" -a "$subcmd" != "help" -a "$subcmd" != "reinstall"
            echo -e "Invalid option: '$subcmd'.\nTry 'milorad help' for more information."
        end
    else
        echo -e "Missing operand.\nTry 'milorad help' for more information."
    end
end
funcsave milorad
echo "The milorad installer has been set up for $USER."
