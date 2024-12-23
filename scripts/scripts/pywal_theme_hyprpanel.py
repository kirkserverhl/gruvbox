import json

# Paths
pywal_colors_path = "/home/kirk/.cache/wal/colors.json"
theme_path = "/home/kirk/.config/ags/themes/monochrome.json"

# Load Pywal colors
with open(pywal_colors_path, "r") as f:
    pywal_colors = json.load(f)

# Extract relevant colors
color1 = pywal_colors["colors"]["color1"]
color2 = pywal_colors["colors"]["color2"]
color3 = pywal_colors["colors"]["color3"]
color4 = pywal_colors["colors"]["color4"]
color5 = pywal_colors["colors"]["color5"]
color6 = pywal_colors["colors"]["color6"]
color7 = pywal_colors["colors"]["color7"]
color8 = pywal_colors["colors"]["color8"]
color9 = pywal_colors["colors"]["color9"]
# color10 = 1c00ff00
# color7 = pywal_colors["colors"]["color7"]
# color7 = pywal_colors["colors"]["color7"]


# Define new mappings
background = color1  # Background uses color1
foreground = color4  # Foreground uses color7
cursor = color1  # Cursor uses color4
new_color0 = color1  # Replace color0 with color1
new_color1 = color2  # Replace color1 with color2
new_color2 = color5  # Replace color2 with color5

# Load HyprPanel theme
with open(theme_path, "r") as f:
    theme = json.load(f)

# Update theme colors with new mappings
theme.update(
    {
        "theme.bar.background": background,
        "theme.bar.menus.background": new_color0,
        "theme.bar.buttons.text": foreground,
        "theme.bar.buttons.background": new_color1,
        "theme.bar.menus.text": new_color2,
        "theme.cursor.color": cursor,
    }
)

# Write updated theme back
with open(theme_path, "w") as f:
    json.dump(theme, f, indent=2)

print("Theme updated with new Pywal color mappings.")
