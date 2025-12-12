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


#functions
print_cc() {
    color="$1"
    text="$2"

    echo -e "\033[${color}${text}\033[0m"
}

check_files() {
    file=$1

    if [[ -f "$file" ]];  then
        print_cc "$GREEN" "$file, has been found"

    else
        print_cc "$RED" "$file, file has NOT been found"
        print_cc "$YELLOW" " reinstall from git "
    fi
}

#actual check .code

print_cc "$BLUE" " Checking files in this folders"

check_files "basic_commands.txt"
check_files "history.txt"
