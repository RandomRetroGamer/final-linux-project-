clear

#colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# the print function to print text with colors, use the color variables before your text as such
# print_cc "$BLUE" " printing colors "


#functions


#prints out the text with real colors?!
print_cc() {
    color="$1"
    text="$2"

    echo -e "\033[${color}${text}\033[0m"
}

print_cc "$GREEN" "Installing pygame! for tetris?"


sudo apt install python3 
python -m venv .venv

source .vnev/bin/activate
pip install pygame

print_cc "$YELLOW" "venv, and pip installed! "
print_cc "$GREEN" "starting main.py"

python3 main.py
