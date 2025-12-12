clear 

#varibles
basic_commands="config/basic_commands.txt"
check_files="config/check.sh"

#colors

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# the print function to print text with colors, use the color variables before your text as such
# print_cc "$BLUE" " printing colors "

#functions
print_cc() {
    color="$1"
    text="$2"

    echo -e "\033[${color}${text}\033[0m"
}

#actual game main .code

./$check_file.sh

print_cc "$GREEN" " === enter game name here ==="


while true; do
    cat $basic_commands






    clear
done
