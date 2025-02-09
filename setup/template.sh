display_header() {

	figlet -f ~/.dotfiles/assets/Graffiti.flf "$1"
}

######  Initialize checklist array  ########

declare -A checklist
mark_completed() {
	checklist["$1"]="[✔️]"
}
mark_skipped() {
	checklist["$1"]="[✖️ ]"
}
