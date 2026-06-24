#!/usr/bin/env bash

clear
# 1. Custom CSS-like styled header component
gum style \
--foreground 99 --border-foreground 99 \
--border double --align center --width 50 --margin "1 2" \
"⚡ DEPLOYMENT ENGINE V2 ⚡" "Powered by Modern Bash-TUI"

# 2. Interactive Input Component with Placeholder
PROJECT_NAME=$(gum input --placeholder "Enter project repository name..." --width 40)
[[ -z "$PROJECT_NAME" ]] && PROJECT_NAME="Default-App"

# 3. Choose List Component (Interactive selector with keyboard support)
echo -e "\nSelect your deployment cluster location:"
CLUSTER=$(gum choose --cursor.foreground="99" "us-east-1 (Virginia)" "eu-central-1 (Frankfurt)" "ap-southeast-1 (Singapore)")

# 4. Filter Component (Fuzzy search like a modern autocomplete dropdown)
echo -e "\nSearch and assign team lead for this pod:"
LEAD=$(gum filter --placeholder="Type to filter employees..." "Alice Smith" "Bob Johnson" "Charlie Brown" "David Miller" "Elena Rostova")

# 5. Confirmation Component
echo -e "\n"
gum confirm "Deploy '$PROJECT_NAME' to $CLUSTER managed by $LEAD?" --default=true

# Check the exit status of the confirmation module
if [ $? -eq 0 ]; then
    # 6. Smooth Spinner Loading Animation
    gum spin --spinner dot --title "Syncing infrastructure matrices..." -- sleep 2
    
    # Render a success banner
    gum style --foreground 46 --bold "✔ Production pipeline triggered successfully!"
else
    gum style --foreground 196 --bold "✖ Operation safely aborted."
fi
