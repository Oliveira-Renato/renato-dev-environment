#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_full_install() {
    bash "$ROOT_DIR/install/system.sh"
    bash "$ROOT_DIR/install/git.sh"
    bash "$ROOT_DIR/install/ssh.sh"
    bash "$ROOT_DIR/install/shell.sh"
    bash "$ROOT_DIR/install/docker.sh"
    bash "$ROOT_DIR/install/php.sh"
    bash "$ROOT_DIR/install/node.sh"
}

success() {
    echo
    echo "✔ $1"
}

error() {
    echo
    echo "✖ $1"
}

show_menu() {
    clear

    echo "======================================"
    echo " Renato Development Environment"
    echo "======================================"
    echo
    echo "1) Full Installation"
    echo
    echo "2) System"
    echo "3) Git"
    echo "4) SSH"
    echo "5) Shell"
    echo
    echo "6) Docker"
    echo "7) PHP"
    echo "8) Node"
    echo "9) PostgreSQL"
    echo "10) VS Code"
    echo "11) AWS CLI"
    echo "12) Steam"
    echo
    echo "0) Exit"
    echo
}

while true; do

    show_menu

    read -rp "Select an option: " option

    case "$option" in

        1)
            run_full_install
            ;;

        2)
            bash "$ROOT_DIR/install/system.sh"
            ;;

        3)
            bash "$ROOT_DIR/install/git.sh"
            ;;

        4)
            bash "$ROOT_DIR/install/ssh.sh"
            ;;

        5)
            bash "$ROOT_DIR/install/shell.sh"
            ;;

	6)
    	    bash "$ROOT_DIR/install/docker.sh"
    	    ;;

        7)
            bash "$ROOT_DIR/install/php.sh"
            ;;

        8)
             bash "$ROOT_DIR/install/node.sh"
            ;;

        9)
            echo "PostgreSQL module not implemented yet."
            ;;

        10)
            echo "VS Code module not implemented yet."
            ;;

        11)
            echo "AWS CLI module not implemented yet."
            ;;

        12)
            echo "Steam module not implemented yet."
            ;;

        0)
            echo
            echo "Goodbye!"
            exit 0
            ;;

        *)
            echo
            echo "Invalid option."
            ;;
    esac

    echo
    read -rp "Press ENTER to continue..."

done

