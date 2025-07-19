#!/bin/bash
if test "$(realpath "$0")" = /usr/local/bin/milorad
    then
    subcmd="$1"
    package="$2"
    currentdir="$(pwd)"
    ans="n"
    cd /opt/milorad/ || exit
    if test "$subcmd" != ""
        then
        if test "$subcmd" = "install"
            then
            if test "$package" != ""
                then
                if test "$package" = "gump-win" -o "$package" = "gump-windows"
                    then
                    echo "Are you sure that you wish to install GUMP for Windows? [Y/n]"
                    read -rp " > " ans
                    if test "$ans" = "Y" -o "$ans" = "y"
                        then
                        if test -e GUMP-Windows/
                            then
                            echo -e "GUMP for Windows is already installed\nDid you mean 'milorad update $package'?\nTry 'milorad help' for more information."
                        else
                            git clone https://github.com/milorad-co/GNU-Useless-Manipulation-Program
                            cd GNU-Useless-Manipulation-Program/ || exit
                            rm -rfv Linux/
                            rm -rfv Development/
                            mv -v Windows/ /opt/milorad/GUMP-Windows/
                            cd /opt/milorad/ || exit
                            rm -rfv GNU-Useless-Manipulation-Program
                            touch gump-win
                            echo -e "#!/bin/bash\nwine /opt/milorad/GUMP-Windows/GUMP.exe" > gump-win
                            echo -e "\nThe GNU Useless Manipulation Program for Windows has been installed.\nIt can be found in the directory /opt/milorad/, but can also be started by entering the command 'gump-win', asumming that you have WINE installed."
                            ans="n"
                        fi
                    fi
                fi
                if test "$package" = "gump-dev" -o "$package" = "gump-development"
                    then
                    echo "Sorry, the development build of GUMP is not available at the moment. It will be released in a few weeks."
                fi
                if test "$package" = "gump-deb" -o "$package" = "gump-linux" -o "$package" = "gump"
                    then
                    echo "Sorry, the Linux build of GUMP is not available at the moment. It will be released in a few weeks."
                fi
                if test "$package" != "gump-deb" -a "$package" != "gump-linux" -a "$package" != "gump" -a "$package" = "gump-dev" -a "$package" != "gump-development" -a "$package" != "gump-win" -a "$package" != "gump-windows"
                    then
                    echo -e "Invalid option: '$package'.\nTry 'milorad help' for more information."
                fi
            else
                echo -e "Missing operand.\nTry 'milorad help' for more information"
            fi
        fi
        if test "$subcmd" = "update" -o "$subcmd" = "reinstall"
            then
            if test "$package" != ""
                then
                if test "$package" = "gump-win" -o "$package" = "gump-windows"
                    then
                    if test -e /opt/milorad/GUMP-Windows/
                        then
                        rm -rfv /opt/milorad/GUMP-Windows/
                        git clone https://github.com/milorad-co/GNU-Useless-Manipulation-Program
                        cd GNU-Useless-Manipulation-Program || exit
                        rm -rfv Linux/
                        rm -rfv Development/
                        mv -v Windows/ /opt/milorad/GUMP-Windows/
                        cd /opt/milorad/ || exit
                        rm -rfv GNU-Useless-Manipulation-Program
                        touch gump-win
                        echo -e "wine /opt/milorad/GUMP-Windows/GUMP.exe" > gump-win
                        echo -e "\nThe GNU Useless Manipulation Program for Windows has been updated."
                    else
                        echo -e "GUMP for Windows is not installed\nDo you want to install it? [Y/n]"
                        read -rp " > " ans
                        if test "$ans" = "Y" -o "$ans" = "y"
                            then
                            milorad install gump-win
                        fi
                    fi
                fi
                if test "$package" = "gump-dev" -o "$package" = "gump-development"
                    then
                    echo -e "GUMP for developers is not installed\nDo you want to install it? [Y/n]"
                    read -rp " > " ans
                    if test "$ans" = "Y" -o "$ans" = "y"
                        then
                        milorad install gump-dev
                    fi
                fi
                if test "$package" = "gump-deb" -o "$package" = "gump-linux" -o "$package" = "gump"
                    then
                    echo -e "GUMP for Linux is not installed\nDo you want to install it? [Y/n]"
                    read -rp " > " ans
                    if test "$ans" = "Y" -o "$ans" = "y"
                        then
                        milorad install gump
                    fi
                fi
                if test "$package" != "gump-deb" -a "$package" != "gump-linux" -a "$package" != "gump" -a "$package" = "gump-dev" -o "$package" = "gump-development" -a "$package" = "gump-win" -a "$package" = "gump-windows"
                    then
                    echo -e "Invalid option: '$package'.\nTry 'milorad help' for more information."
                fi
            else
                rm -rfv "$(realpath "$0")"
                git clone https://github.com/milorad-co/milorad-installer/
                cd milorad-installer/ || exit
                chmod +x milorad.sh
                sudo ./milorad.sh
                cd ..
                rm -r milorad-installer/
                echo -e "\nThe Milorad Application Installer has been updated."
            fi
        fi
        if test "$subcmd" = "remove"
            then
            if test "$package" != ""
                then
                if test "$package" = "gump" -o "$package" = "gump-deb" -o "$package" = "gump-linux"
                    then
                    echo "GUMP was not installed, so not removed."
                fi
                if test "$package" = "gump-dev" -o "$package" = "gump-development"
                    then
                    echo "GUMP for development was not installed, so not removed."
                fi
                if test "$package" = "gump-win" -o "$package" = "gump-windows"
                    then
                    if test -e /opt/milorad/GUMP-Windows/
                        then
                        rm -rfv /opt/milorad/GUMP-Windows/
                        echo -e "\nGUMP for Windows has been removed."
                    else
                        echo "GUMP for Windows was not installed, so not removed."
                    fi
                fi
            fi
        fi
        if test "$subcmd" = "help"
            then
            echo "Milorad Application Installer (M.A.I.)
Usage: sudo milorad <subcommand> <application>

Milorad Application Installer (M.A.I.) is a commandline Milorad application manager and
provides commands for installing, removing, and updating all Milorad appliations, such
as GUMP.

Subcommands
help               display this help
install            install an application
remove             remove an installed application
update/reinstall   remove an installed application (or this installer if no application
                   name is provided) then install the latest version of that application
Applications
gump               a useless art program
gump-dev           the developer beta of gump, for use with gamemaker
gump-win           the windows version of gump"
        fi
        if test "$subcmd" != "install" -a "$subcmd" != "update" -a "$subcmd" != "remove" -a "$subcmd" != "help"
            then
            echo -e "Invalid option: '$subcmd'.\nTry 'milorad help' for more information."
        fi
    else
        echo -e "Missing operand.\nTry 'milorad help' for more information."
    fi
    cd "$currentdir" || exit
else
    mv -fv "$(realpath "$0")" /usr/local/bin/milorad
    mkdir -pv /opt/milorad/
    echo "The Milorad Application installer has been set up. Run the command 'milorad help' for general help."
fi
