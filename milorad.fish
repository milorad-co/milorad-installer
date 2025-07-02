function milorad --argument subcmd package os
    set ans "n"
    cd /bin/milorad/
    if set -q subcmd
        if test "$subcmd" = "install"
            echo $package
            if set -q package
                if test "$package" = "gump"
                    if test "$os" = "win" -o "$os" = "windows"
                        echo "Installing GUMP for Windows will take up 12mb of space. Install anyway? [Y/n]"
                        read --prompt-str " > " ans
                        if test $ans = "Y" -o $ans = "y"
                            if test -e /bin/milorad/GUMP-Windows/
                                echo -e "milorad update gump $os: GUMP for Windows is already installed\nDid you mean 'milorad update gump $os'?\nTry 'milorad help' for more information."
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
                    if test "$os" = "dev" -o "$os" = "development"
                        echo "Sorry, the development build of GUMP is not available at the moment. It will be released in a few weeks."
                    end
                    if test "$os" = "deb" -o "$os" = "linux" -o "$os" = ""
                        echo "Sorry, the Linux build of GUMP is not available at the moment. Its release date is unknown."
                    end
                    if test "$os" != "deb" -o "$os" != "linux" -o "$os" != "" -o "$os" = "dev" -o "$os" = "development" -o "$os" = "win" -o "$os" = "windows"
                        echo -e "milorad install gump: invalid option -- '$os'\nTry 'milorad help' for more information."
                    end
                end
                if test "$package" != "gump"
                    echo -e "milorad install: invalid option -- '$package'\nTry 'milorad help' for more information."
                end
            else
                echo -e "milorad install: missing operand\nTry 'milorad help' for more information"
            end
        end
        if test "$subcmd" = "update" -o "$subcmd" = "reinstall"
            if test -q package
                if test "$package" -eq "gump"
                    if test "$os" = "win" -o "$os" = "windows"
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
                            echo "milorad update gump $os: GUMP for Windows is not installed\nDo you want to install it? [Y/n]"
                            read --prompt-str " > " ans
                            if test $ans = "Y" -o $ans = "y"
                                milorad install gump win
                            end
                        end
                    end
                    if test "$os" = "dev" -o "$os" = "development"
                        echo "milorad update gump $os: GUMP for developers is not installed\nDo you want to install it? [Y/n]"
                        read --prompt-str " > " ans
                        if test $ans = "Y" -o $ans = "y"
                            milorad install gump dev
                        end
                    end
                    if test "$os" = "deb" -o "$os" = "linux"
                        echo "milorad update gump $os: GUMP for Linux is not installed\nDo you want to install it? [Y/n]"
                        read --prompt-str " > " ans
                        if test $ans = "Y" -o $ans = "y"
                            milorad install gump
                        end
                    end
                    if test "$os" = ""
                        echo "milorad update gump: GUMP (for Linux) is not installed\nDo you want to install it? [Y/n]"
                        read --prompt-str " > " ans
                        if test $ans = "Y" -o $ans = "y"
                            milorad install gump
                        end
                    end
                    if test "$os" != "deb" -o "$os" != "linux" -o "$os" != "" -o "$os" = "dev" -o "$os" = "development" -o "$os" = "win" -o "$os" = "windows"
                        echo -e "milorad update gump: invalid option -- '$os'\nTry 'milorad help' for more information."
                    end
                end
            else
                echo -e "milorad update: missing operand\nDid you mean 'milorad update-all'?\nTry 'milorad help' for more information."
            end
        end
        if test "$subcmd" = "installer"
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
        if test "$subcmd" = "remove"
            if set -q "$argv"
                if test "$package" = "gump"
                    echo "me no be bothered"
                end
            end
        end
        if test "$subcmd" = "help"
            echo "me no be bothered"
        end
        if test "$subcmd" != "install" -a "$subcmd" != "update" -a "$subcmd" != "remove" -a "$subcmd" != "help"
            echo -e "milorad: invalid option -- '$subcmd'\nTry 'milorad help' for more information."
        end
    else
        echo -e "milorad: missing operand\nTry 'milorad help' for more information."
    end

end
