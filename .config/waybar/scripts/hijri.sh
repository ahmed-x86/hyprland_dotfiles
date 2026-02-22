#!/bin/bash

# جلب بيانات اليوم الحالي
current_data=$(curl -s "https://api.aladhan.com/v1/gToH/$(date +%d-%m-%Y)")
h_day=$(echo $current_data | jq -r '.data.hijri.day | tonumber')
h_month_name=$(echo $current_data | jq -r '.data.hijri.month.ar')
h_year=$(echo $current_data | jq -r '.data.hijri.year')
h_month_num=$(echo $current_data | jq -r '.data.hijri.month.number')


calendar_days=""
for i in {1..30}; do
    
    printf -v formatted_day "%2d" $i
    
    if [ $i -eq $h_day ]; then
        
        calendar_days+="<span color='#A6E3A1' weight='bold' underline='single'>$formatted_day</span>  "
    else
        calendar_days+="<span color='#CDD6F4'>$formatted_day</span>  "
    fi
    
    
    if [ $((i % 7)) -eq 0 ]; then
        calendar_days+="\n"
    fi
done


TEXT="🌙 $h_day $h_month_name"
TOOLTIP="<span size='16000' weight='bold' color='#CBA6F7'>$h_month_name $h_year</span>\n\n<tt>$header\n$calendar_days</tt>"

echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\"}"