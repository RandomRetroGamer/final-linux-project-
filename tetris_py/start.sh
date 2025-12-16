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

source .venv/bin/activate

print_cc "$RED" "source ./venv started"
print_cc "$GREEN" " * main.py starting "


python3 main.py
