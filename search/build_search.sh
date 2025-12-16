clear

#colors

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

#variables



#functions
print_cc() {
    color="$1"
    text="$2"

    echo -e "\033[${color}${text}\033[0m"
}


#main .code

print_cc "$YELLOW" " do you want to install web_browser"

while true; do
    read -p "( y / n )  " yn

    case $yn in
        [Yy]* ) print_cc "$YELLOW" " installing "; break;;
        [Nn]* ) print_cc "$RED" " !stopping build.sh file! "; exit;;
        * ) echo invalid response;;
    esac
done

sudo apt update
sudo apt install ddgr

print_cc "$GREEN" " successfully installed ddgr "



