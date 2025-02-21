#!/bin/sh
# This script grabs a random message to use in the bottom of the Hyprlock screen


#list of sentences
MESSAGES=(
    "This is Arch Linux (btw)"
    "I love the smell of fresh code in the morning."
    "Code is like humor. When you have to explain it, it's bad."
    "I'm not lazy, I'm just on energy-saving mode."
    "I'm not a magician, but I can see why you might think that."
    "I went to a street where the houses were numbered 8k, 16k, 32k, 64k, 128k, 256k and 512k. It was a trip down Memory Lane."
    "I would tell you a joke about Rust, but it's borrowed."
    "I would tell you a joke about Java, but it has no class."
    "The best thing about a Boolean is that even if you are wrong, you are only off by a bit."
    "An SQL query goes into a bar, walks up to two tables and asks: \"Can I join you?\""
    ".titanic { float:none;}"
    "I can't wait for the next JavaScript framework to come out..."
)

# Get a random sentence from the list
RANDOM_MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

# Print the random sentence
echo "$RANDOM_MESSAGE"

