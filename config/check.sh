#to check all the files that this program needs is actually in the folder
#if the program doesn't have the files this script should stop running and you should reinstall the git

#colors

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# the print function to print text with colors, use the color variables before your text as such
# print_cc "$BLUE" " printing colors "

#varibles

basic_commands="basic_commands.txt"

#functions
print_cc() {
    color="$1"
    text="$2"

    echo -e "\033[${color}${text}\033[0m"
}

#actual check .code

print_cc "$BLUE" " Checking files in this folders"

if [[ -f "$basic_commands" ]]; then
	print_cc "$GREEN" " This file has all the files intact, procceding "
else
	print_cc "$RED" " Missing files! reinstall the git: $basic_commands"
	exit

fi

clear

