clear

#colors

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# the print function to print text with colors, use the color variables before your text as such
# print_cc "$BLUE" " printing colors "


print_cc() {
    color="$1"
    text="$2"

    echo -e "\033[${color}${text}\033[0m"
}

print_cc "$GREEN" "-- running build.sh file --"
print_cc "$RED" "-- this is only made for debian / ubuntu distros are you ready to continue ? --"


#a y / n question for user to see if they want to install the dependences they are going to need to run the game


while true; do
    read -p "( y / n )  " yn

    case $yn in
        [Yy]* ) print_cc "$YELLOW" " installing "; break;;
        [Nn]* ) print_cc "$RED" " !stopping build.sh file! "; exit;;
        * ) echo invalid response;;
    esac
done

#installing updates for ubuntu / debain based distros

sudo apt update
sudo apt install python3 python3-pip

print_cc "$YELLOW" " Done installing dependences "
print_cc "$GREEN" " Starting main.sh file "

sudo chmod +x main.sh
./main.sh
