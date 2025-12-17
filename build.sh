clear

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

print_cc() {
    color="$1"
    text="$2"

    echo -e "\033[${color}${text}\033[0m"
}

print_cc "$GREEN" "-- running build.sh file --"
print_cc "$RED" "-- this is only made for debian / ubuntu distros are you ready to continue ? --"

while true; do
    read -p "( y / n )  " yn

    case $yn in
        [Yy]* ) print_cc "$YELLOW" " installing "; break;;
        [Nn]* ) print_cc "$RED" " !stopping build.sh file! "; exit;;
        * ) echo invalid response;;
    esac
done

print_cc "$RED" "installing dependences"

sudo apt update
print_cc "$RED" " ** system updating"

# Pygame system dependencies (SDL libraries) for guaranteed first-run success
sudo apt install -y libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev python3-dev smpeg
print_cc "$RED" " ** installing Pygame system dependencies (SDL libraries)"

sudo apt install -y python3-pip
print_cc "$RED" " ** installing python3-pip"

sudo apt install -y ddgr
print_cc "$RED" " ** installing ddgr"

pip3 install pygame
print_cc "$RED" " ** installing pygame"

print_cc "$RED" " ** starting main.sh file"

MAIN_SCRIPT="main.sh"
CHECK_SCRIPT="config/check.sh"
SEARCH_SCRIPT="search/search.sh"
SEARCH_BUILD_SCRIPT="search/config/search_build.sh"


print_cc "$YELLOW" "Making scripts executable..."

sudo chmod +x "$MAIN_SCRIPT" 2>/dev/null
if [ $? -eq 0 ]; then
    print_cc "$GREEN" "** chmod +x $MAIN_SCRIPT complete"
else
    print_cc "$RED" "ERROR: Could not find or set executable flag for $MAIN_SCRIPT"
fi

sudo chmod +x "$CHECK_SCRIPT" 2>/dev/null
if [ $? -eq 0 ]; then
    print_cc "$GREEN" "** chmod +x $CHECK_SCRIPT complete"
else
    print_cc "$RED" "ERROR: Could not find or set executable flag for $CHECK_SCRIPT"
fi

sudo chmod +x "$SEARCH_SCRIPT" 2>/dev/null
if [ $? -eq 0 ]; then
    print_cc "$GREEN" "** chmod +x $SEARCH_SCRIPT complete"
else
    print_cc "$RED" "ERROR: Could not find or set executable flag for $SEARCH_SCRIPT"
fi

sudo chmod +x "$SEARCH_BUILD_SCRIPT" 2>/dev/null
if [ $? -eq 0 ]; then
    print_cc "$GREEN" "** chmod +x $SEARCH_BUILD_SCRIPT complete"
else
    print_cc "$RED" "ERROR: Could not find or set executable flag for $SEARCH_BUILD_SCRIPT"
fi


print_cc "$RED" " -- starting build file for robocorp search -- "


./$CHECK_SCRIPT
./$SEARCH_BUILD_SCRIPT
./$MAIN_SCRIPT