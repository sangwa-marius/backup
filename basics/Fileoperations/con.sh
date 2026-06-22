#!/usr/bin/env bash

zenity --info \
--title="Welcome screen" \
--text="Welcome to the system Setup Wizard.\nClick ok to continue"

username=$(
    zenity --entry \
    --title="Input require" \
    --text="Enter your username" \
)

if [[ -z $username ]]; then
    zenity --error \
    --text="Please the username is required" \
    --title="Username error"
fi

language=$(
    zenity --list \
    --text="Thank you $username select your primary programming language" \
    --column="Languages" "Python" "Bash" "Go" "Rust" "Scalar"
)

(
    echo 0; sleep 0.5
    echo 5; echo "#5%"; sleep 0.5
    echo 10; echo "#10%"; sleep 0.5
    echo 15; echo "#15%"; sleep 0.5
    echo 20; echo "#20%"; sleep 0.5
    echo 25; echo "#25%"; sleep 0.5
    echo 30; echo "#30%"; sleep 0.5
    echo 35; echo "#35%"; sleep 0.5
    echo 40; echo "#40%"; sleep 0.5
    echo 45; echo "#45%"; sleep 0.5
    echo 50; echo "#50%"; sleep 0.5
    echo 55; echo "#55%"; sleep 0.5
    echo 60; echo "#60%"; sleep 0.5
    echo 65; echo "#65%"; sleep 0.5
    echo 70; echo "#70%"; sleep 0.5
    echo 75; echo "#75%"; sleep 0.5
    echo 80; echo "#80%"; sleep 0.5
    echo 85; echo "#85%"; sleep 0.5
    echo 90; echo "#90%"; sleep 0.5
    echo 95; echo "#95%"; sleep 0.5
    echo 100; echo "#100%"; sleep 2
) | zenity --progress \
--text="System setup" \
--percentage=0 \
