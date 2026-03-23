#!/usr/bin/env bash

PHONEID=$(kdeconnect-cli -l --id-only | head -n 1)
ICON="" 

if [ "$1" == "--ping" ]; then
    if [ -n "$PHONEID" ]; then
        kdeconnect-cli -d "$PHONEID" --ping
    fi
    exit 0
fi

if ! pgrep -x kdeconnectd > /dev/null; then
    echo "{\"text\": \"$ICON ?\", \"class\": \"critical\", \"tooltip\": \"KDE Connect service not running\"}"
    exit 0
fi


if [ -z "$PHONEID" ]; then
    echo "{\"text\": \"$ICON --\", \"class\": \"critical\", \"tooltip\": \"No device found\"}"
    exit 0
fi


reachable=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID org.kde.kdeconnect.device.isReachable 2>/dev/null)

if [ "$reachable" != "true" ]; then
    echo "{\"text\": \"$ICON \", \"class\": \"warning\", \"tooltip\": \"Device not reachable\"}"
    exit 0
fi


battery=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID/battery org.kde.kdeconnect.device.battery.charge 2>/dev/null)
is_charging=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID/battery org.kde.kdeconnect.device.battery.isCharging 2>/dev/null)

if [ -z "$battery" ]; then
    echo "{\"text\": \"$ICON --%\", \"class\": \"critical\"}"
else
    
    if [ "$battery" -le 20 ]; then
        color="critical"
    elif [ "$battery" -le 50 ]; then
        color="warning"
    else
        color="normal"
    fi

    
    if [ "$is_charging" == "true" ]; then
        INFO="$ICON  $battery%"
    else
        INFO="$ICON $battery%"
    fi

    
    echo "{\"text\": \"$INFO\", \"class\": \"$color\", \"tooltip\": \"Battery: $battery%\"}"
fi