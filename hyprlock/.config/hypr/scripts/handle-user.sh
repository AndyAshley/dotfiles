#!/bin/sh
# This script grabs a random greeting to use above the password input on the Hyprlock screen

# Get the username from the system
USER=$(whoami)
USER_CAPITALIZED=$(echo "$USER" | sed 's/^./\U&/')

GREETINGS=(
    "Hey there, ${USER_CAPITALIZED}."
    "Welcome back, ${USER_CAPITALIZED}."
    "Hello, ${USER_CAPITALIZED}."
    "Good to see you again, ${USER_CAPITALIZED}."
    "Hey, it's you again, ${USER_CAPITALIZED}."
    "Hi there, ${USER_CAPITALIZED}."
    "Welcome back to your computer, ${USER_CAPITALIZED}."
    "Hello again, ${USER_CAPITALIZED}."
)

RANDOM_GREETING="${GREETINGS[RANDOM % ${#GREETINGS[@]}]}"

echo "$RANDOM_GREETING"
