#!/bin/bash

# ملف مؤقت لتخزين القيمة الحالية
CACHE="$HOME/.cache/hyprsunset_level"

# لو الملف مش موجود نحطه بقيمة افتراضية
if [ ! -f "$CACHE" ]; then
    echo 3500 > "$CACHE"
fi

LEVEL=$(cat "$CACHE")

case "$1" in
    up)
        LEVEL=$((LEVEL + 200))
        ;;
    down)
        LEVEL=$((LEVEL - 200))
        ;;
esac

# حدود منطقية
if [ "$LEVEL" -gt 6500 ]; then LEVEL=6500; fi
if [ "$LEVEL" -lt 1000 ]; then LEVEL=1000; fi

echo "$LEVEL" > "$CACHE"

# تطبيق القيمة على hyprsunset
pkill -x hyprsunset
hyprsunset -t "$LEVEL" &

# إرسالها إلى OSD
swayosd-client --custom "Sunset: $LEVEL K"
