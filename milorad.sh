#!/bin/fish
mkdir -pv ~/.milorad/
function milorad -a subcmd package
    set currentdir $PWD
    set ans "n"
    cd ~/.milorad/
    if test "$subcmd" != ""
        if test "$subcmd" = "install"
            if test "$package" != ""
                if test "$package" = "gump-win" -o "$package" = "gump-windows"
                    echo "Are you sure that you wish to install GUMP for Windows? [Y/n]"
                    read --prompt-str " > " ans
                    if test $ans = "Y" -o $ans = "y"
                        if test -e ~/.milorad/GUMP-Windows/
                            echo -e "GUMP for Windows is already installed\nDid you mean 'milorad update $package'?\nTry 'milorad help' for more information."
                        else
                            git clone https://github.com/milorad-co/GNU-Useless-Manipulation-Program
                            cd GNU-Useless-Manipulation-Program/
                            rm -rfv Linux/
                            rm -rfv Development/
                            mv -v Windows/ ~/.milorad/GUMP-Windows/
                            cd ~/.milorad/
                            rm -rfv GNU-Useless-Manipulation-Program
                            function gump-win
                                wine ~/.milorad/GUMP-Windows/GUMP.exe
                            end
                            funcsave gump-win
                            echo -e "\nThe GNU Useless Manipulation Program for Windows has been installed.\nIt can be found in the directory ~/.milorad/, but can also be started by entering the command 'gump-win', asumming that you have WINE installed."
                            set ans 0
                        end
                    end
                end
                if test "$package" = "gump-dev" -o "$package" = "gump-development"
                    echo "Sorry, the development build of GUMP is not available at the moment. It will be released in a few weeks."
                end
                if test "$package" = "gump-deb" -o "$package" = "gump-linux" -o "$package" = "gump"
                    echo "Sorry, the Linux build of GUMP is not available at the moment. It will be released in a few weeks."
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
                    if test -e ~/.milorad/GUMP-Windows/
                        rm -rfv ~/.milorad/GUMP-Windows/
                        git clone https://github.com/milorad-co/GNU-Useless-Manipulation-Program
                        cd GNU-Useless-Manipulation-Program
                        rm -rfv Linux/
                        rm -rfv Development/
                        mv -v Windows/ ~/.milorad/GUMP-Windows/
                        cd ~/.milorad/
                        rm -rfv GNU-Useless-Manipulation-Program
                        function gump-win
                            wine ~/.milorad/GUMP-Windows-Stable/GUMP.exe
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
                sudo mkdir -pv ~/.milorad
                cd ~/.milorad/
                git clone https://github.com/milorad-co/milorad-installer
                cd milorad-installer
                rm -fv README.md
                mv -fv milorad-installer.sh ~/.milorad/milorad-installer.sh
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
                    if test -e ~/.milorad/GUMP-Windows/
                        rm -rfv ~/.milorad/GUMP-Windows/
                        echo -e "\nGUMP for Windows has been removed."
                    else
                        echo "GUMP for Windows was not installed, so not removed."
                    end
                end
            end
        end
        if test "$subcmd" = "help"
            echo "Milorad Application Installer (M.A.I.)
Usage: milorad <subcommand> <application>

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
echo "The Milorad Application installer has been set up for $USER. All functions created by this installer will be created only for that user. Run the command 'milorad help' for general help."
