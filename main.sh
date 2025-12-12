clear 

#varibles
basic_commands="config/basic_commands.txt"
check_files="config/check.sh"
history_file="config/history.txt"

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

#did you even read the name?
clear_terminal() {
    print_cc "$RED" "clear terminal..."

    sleep 2
    clear

    cat $basic_commands

}

history_terminal() {
    print_cc "$YELLOW" "=== History ==="

    tail -n 10 $history_file

    print_cc "$YELLOW" "==============="
}

#actual game main .code

print_cc "$GREEN" " === enter game name here ==="

cat $basic_commands

while true; do
    #reads the input of the user and outputs just cause, really the output doesn't really have a purpouse

    read -p "${print_cc}${RED}: " user_input

    printf "%s\n" "$user_input" >> config/history.txt

    print_cc "$YELLOW" "output >> $user_input \n"

    #clears the "terminal", don't you use linux?!
    if [ "$user_input" == "clear" ]; then

        clear_terminal

    elif [ "$user_input" == "history" ]; then

        history_terminal


    else

        print_cc "$RED" "no command!"

    fi

done
