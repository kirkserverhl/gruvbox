# source the colors.
. "${HOME}/.cache/wal/colors.sh"

# Set the border colors.
bspc config normal_border_color "$color1"
bspc config active_border_color "$color2"
bspc config focused_border_color "$color15"
# Use the line below if you are on bspwm >= 0.9.4
bspc config presel_feedback_color "$color1"
# Use the line below if you are on bspwm < 0.9.4
#bspc config presel_border_color "$color1"