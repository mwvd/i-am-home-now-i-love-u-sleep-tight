#!/bin/sh

#config
home="City"
n=23
m=4
b="Your Best Friend"
message="i am home now i love u sleep tight"
thinkin="thinking about u :)"

HOUR="$(date +"%H")"
MIN="$(date +"%M")"
WYA="$(curl https://ipinfo.io/city -s)"
if [ "$WYA" = "$home" ]; then
    if [ $m -gt "$HOUR" ] || [ "$HOUR" -ge $n ]; then
        osascript -e "tell application \"Messages\" to send \"$message\" to buddy \"$b\""
    elif [ "$MIN" = "04" ] || [ "$MIN" = "21" ] || [ "$MIN" = "35" ]; then
        osascript -e "tell application \"Messages\" to send \"$thinkin\" to buddy \"$b\""
    else
        printf "you are feeling warmly about $b\n"
        printf "and your love for them is so strong\n"
        printf "that there simply isn't enough bandwidth\n"
        printf "available w this app to let them know\n"
        printf "\n"
        printf "you decide to try later 🌻\n"
    fi
else
    printf "You're in $WYA, not home lol\n"
fi