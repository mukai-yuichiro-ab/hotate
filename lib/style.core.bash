#!/usr/bin/env bash

# lib/text_style.bash

text_style() {
    while [ $# -gt 0 ]; do
        case "$1" in
            reset) echo -ne "\e[0m" ;;

            bold)      echo -ne "\e[1m" ;;
            faint)     echo -ne "\e[2m" ;;
            italic)    echo -ne "\e[3m" ;;
            underline) echo -ne "\e[4m" ;;
            blink)     echo -ne "\e[5m" ;;
            blinkfast) echo -ne "\e[6m" ;;
            negative)  echo -ne "\e[7m" ;;
            conceal)   echo -ne "\e[8m" ;;
            strike)    echo -ne "\e[9m" ;;

            normal)      echo -ne "\e[22m" ;;
            roman)       echo -ne "\e[23m" ;;
            nounderline) echo -ne "\e[24m" ;;
            noblink)     echo -ne "\e[25m" ;;
            positive)    echo -ne "\e[27m" ;;
            reveal)      echo -ne "\e[28m" ;;
            nostrike)    echo -ne "\e[29m" ;;

            black)   echo -ne "\e[1;30m" ;;
            red)     echo -ne "\e[1;31m" ;;
            green)   echo -ne "\e[1;32m" ;;
            yellow)  echo -ne "\e[1;33m" ;;
            blue)    echo -ne "\e[1;34m" ;;
            magenta) echo -ne "\e[1;35m" ;;
            cyan)    echo -ne "\e[1;36m" ;;
            white)   echo -ne "\e[37m" ;;
            xterm)   echo -ne "\e[38;5;$2m" ; shift ;;


            default) echo -ne "\e[39m" ;;

            bgblack)   echo -ne "\e[40m" ;;
            bgred)     echo -ne "\e[41m" ;;
            bggreen)   echo -ne "\e[42m" ;;
            bgyellow)  echo -ne "\e[43m" ;;
            bgblue)    echo -ne "\e[44m" ;;
            bgmagenta) echo -ne "\e[45m" ;;
            bgcyan)    echo -ne "\e[46m" ;;
            bgwhite)   echo -ne "\e[47m" ;;
            bgxterm)   echo -ne "\e[48;5;$2m" ; shift ;;
            bgdefault) echo -ne "\e[49m" ;;

            *)
                echo "Unknown code: $token" 1>&2
                exit 1
                ;;
        esac
        shift
    done
}

