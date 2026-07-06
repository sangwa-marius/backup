#!/usr/bin/env bash

DB_FILE="servers.csv"

# Verify the database file exists before initializing the pipeline
if [ ! -f "$DB_FILE" ]; then
    gum style --foreground 196 --bold "✖ Critical Error: Database file '$DB_FILE' not found!"
    exit 1
fi

while true; do
    clear

    # 1. Dashboard Header Layout Component
    gum style --foreground "#8A2BE2" --border double --align center --width 65 --margin "1 0" \
        "🖥 INFRASTRUCTURE ACTIVE INVENTORY METRICS 🖥" "Fuzzy Filtering & State Inspection Hub"

    # 2. Render Live Data View Table Layer
    echo -e "\e[1mActive Database Records Matrix:\e[0m"
    gum table --widths=5,22,14,13,13 --border=rounded --header.foreground="#8A2BE2" < "$DB_FILE"

    echo -e "\n[Press ESC/Ctrl+C to quit dashboard layout]"
    
    # 3. Interactive Selection Pipeline (Extracts Server Names for fuzzy searching)
    SELECTED_SERVER=$(awk -F',' 'NR>1 {print $2}' "$DB_FILE" | gum filter --placeholder="Type to filter inventory records...")

    # If the user presses Escape or closes the filter menu, terminate the application loop cleanly
    if [ -z "$SELECTED_SERVER" ]; then
        clear
        gum style --foreground "#8A2BE2" "✔ Dashboard application terminated cleanly."
        break
    fi

    # 4. Database Query Layer
    SERVER_ROW=$(grep -w "$SELECTED_SERVER" "$DB_FILE")
    IFS="," read -r ID NAME LOC STATUS IP <<< "$SERVER_ROW"

    # 5. UI Logic Layer (Dynamic text color based on server status state)
    if [ "$STATUS" == "Online" ]; then
        STATUS_BOX="$(gum style --foreground 46 --bold "● ONLINE")"
    elif [ "$STATUS" == "Maintenance" ]; then
        STATUS_BOX="$(gum style --foreground 214 --bold "⚠ MAINTENANCE")"
    else
        STATUS_BOX="$(gum style --foreground 196 --bold "○ OFFLINE")"
    fi

    # 6. Render the Detailed Record Presentation Card
    clear
    gum style --foreground "#00FF87" --border normal --padding "1 2" --width 50 \
        "🔍 INSPECTION MANIFEST NODE: #$ID" \
        "Host Identifier:  $NAME" \
        "Target Location:  $LOC" \
        "Network Address:  $IP" \
        "Operational State: $STATUS_BOX"

    # Pause execution until user hits a key to return to the database screen
    echo -e "\n"
    gum input --placeholder "Press [ENTER] to return to database view..." --width 45 > /dev/null
done
