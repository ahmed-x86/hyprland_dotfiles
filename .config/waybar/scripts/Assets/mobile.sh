#!/usr/bin/env bash

PHONEID=$(kdeconnect-cli -l --id-only | head -n 1)
ICON="" 
LOW_BATTERY_THRESHOLD=20
STATE_FILE="/tmp/phone_charging_state" 

send_notification() {
    notify-send -u critical -i "battery-low" "KDE Connect" " $1%"
}

send_discharged_notification() {
    notify-send -u normal -i "battery-discharging" "KDE Connect" "Charger Disconnected"
}

send_charging_notification() {
    notify-send -u normal -i "battery-charging" "KDE Connect" "Charger Connected"
}
# ---------------------------------------

if [ "$1" == "--ping" ]; then
    if [ -n "$PHONEID" ]; then
        kdeconnect-cli -d "$PHONEID" --ping
    fi
    exit 0
fi

if [ "$1" == "--clipboard" ]; then
    if [ -n "$PHONEID" ]; then
        kdeconnect-cli -d "$PHONEID" --share-text "$(wl-paste)"
        notify-send -u low -i "clipboard" "KDE Connect" "Clipboard sent to phone"
    fi
    exit 0
fi
# --------------------------------

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
    if [ -f "$STATE_FILE" ]; then
        PREV_STATE=$(cat "$STATE_FILE")
        if [ "$PREV_STATE" == "true" ] && [ "$is_charging" == "false" ]; then
            send_discharged_notification
        elif [ "$PREV_STATE" == "false" ] && [ "$is_charging" == "true" ]; then
            send_charging_notification
        fi
        # ---------------------------------
    fi
    echo "$is_charging" > "$STATE_FILE"

    if [ "$battery" -le "$LOW_BATTERY_THRESHOLD" ] && [ "$is_charging" != "true" ]; then
        if [ ! -f "/tmp/phone_low_bat_notified" ]; then
            send_notification "$battery"
            touch "/tmp/phone_low_bat_notified"
        fi
    elif [ "$battery" -gt "$LOW_BATTERY_THRESHOLD" ]; then
        rm -f "/tmp/phone_low_bat_notified"
    fi
    if [ "$battery" -le 20 ]; then
        color="critical"
    elif [ "$battery" -le 50 ]; then
        color="warning"
    else
        color="normal"
    fi


    if [ "$is_charging" == "true" ]; then
        INFO="$ICON  $battery%"
        rm -f "/tmp/phone_low_bat_notified"
    else
        INFO="$ICON $battery%"
    fi
    echo "{\"text\": \"$INFO\", \"class\": \"$color\", \"tooltip\": \"Battery: $battery%\"}"
fi

