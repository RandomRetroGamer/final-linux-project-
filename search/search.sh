clear

# color 
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

#varibale 
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"



logo="$PROJECT_ROOT/config/logo.txt"
history_file="config/history.txt"


#functions
print_cc() {
    local color_var="$1"
    local text="$2"


    echo -e "${color_var}${text}${RESET}"
}

history_terminal() {
    print_cc "$YELLOW" "=== History ==="

    tail -n 10 $history_file

    print_cc "$YELLOW" "==============="
}

print_cc "$GREEN" "welcome to robo-search to use type search (your topic here)"
print_cc "$RED" "commands | search | history | exit |"

#actual code 
while true; do
    user_input=$(print_cc "$GREEN" "Search: ")

    read -p "RoboCorp / $user_input" user_input
    printf "%s\n" "$user_input" >> config/history.txt

    print_cc "$YELLOW" "Search  >> $user_input \n"\


    if [[ "$user_input" =~ ^[Ss][Ee][Aa][Rr][Cc][Hh]\ + ]]; then
        search_query="${user_input#*([Ss][Ee][Aa][Rr][Cc][Hh] )}"
        print_cc "$GREEN" " >> seaching in DUCKduckGo for $seach_query\n"

        ddgr --np "$search_query"
        print_cc "$YELLOW" "User searched for >> $user_input \n"
        printf "%s\n" "user searched for $user_input: " >> config/search_history.txt

    elif [[ "$user_input" = "search" ]]; then
        print_cc "$RED" "You need to add a sentence or a name to search something! "

    elif [[ "$user_input" = "history" ]]; then
        history_terminal

    elif [[ "$user_input" = "exit" ]]; then
        break
        
    else
        print_cc "$RED" " ! ERROR: command not found \n"
   fi





    
    
done

print_cc "$RED" "Exiting search back to main..."
exit 0