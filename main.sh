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

all_history() {
    print_cc "$BLUE" "=== All_History ==="

    cat $history_file

    print_cc "$BLUE" "==================="

}

exit_terminal() {
    print_cc "$RED" "Exiting terminal..."

    exit
}

#actual game main .code

print_cc "$GREEN" " === enter game name here ==="

cat $basic_commands

while true; do
    #reads the input of the user and outputs just cause, really the output doesn't really have a purpouse

    read -p "${print_cc}${RED}: " user_input

    printf "%s\n" "$user_input" >> config/history.txt

    print_cc "$YELLOW" "output >> $user_input \n"











    #if and elif statements that are the heart of the terminal.
    #clears the "terminal", don't you use linux?!
    if [ "$user_input" == "clear" ]; then

        clear_terminal

    elif [ "$user_input" == "exit" ]; then

        exit_terminal # stops the program from running any further

    elif [ "$user_input" == "history" ]; then

        history_terminal #look at the functions section to see what this does
        #shows the last ten lines of your history text file

    elif [ "$user_input" == "all history" ]; then

        all_history #shows all the history of your terminal

    else

        print_cc "$RED" "no command!"

    fi

done
