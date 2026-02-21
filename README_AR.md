<div align="center">

[**🇸🇦 العربية**](./README_AR.md) | [**🇺🇸 English**](./README.md)

</div>

---

<div align="center">
  <h1>🍙 ملفات إعدادات Hyprland الخاصة بي</h1>
  <p><i>إعداد Hyprland بسيط، مخصص بشكل كبير، وعملي على Arch Linux.</i></p>

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge\&logo=arch-linux\&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-004450?style=for-the-badge\&logo=hyprland\&logoColor=white)
![Waybar](https://img.shields.io/badge/Waybar-292D3E?style=for-the-badge)
![Kitty](https://img.shields.io/badge/Kitty-504945?style=for-the-badge\&logo=gnome-terminal\&logoColor=white)
![Zsh](https://img.shields.io/badge/Zsh-4EAA25?style=for-the-badge\&logo=gnu-bash\&logoColor=white)
![Catppuccin](https://img.shields.io/badge/Catppuccin-F8BD96?style=for-the-badge)

</div>
<br>

مرحبًا بك في إعداداتي الشخصية لـ **Hyprland** (ملفات dotfiles). تم تصميم هذا الإعداد ليكون جميلًا بصريًا باستخدام ألوان Catppuccin، مع الحفاظ على أداء عالٍ وسهولة استخدام يومية عملية.

## ✨ المميزات

* **سريع وخفيف:** مبني على Arch Linux مع مدير النوافذ Hyprland (Wayland).
* **واجهة جمالية:** تكامل كامل لثيم Catppuccin عبر النظام، تطبيقات GTK، والطرفية.
* **Waybar متقدم:** شريط حالة قابل للتخصيص بوحدات مخصصة (تقويم هجري، مؤشرات خصوصية ديناميكية، خريطة نشاط GitHub، مؤشر شحن الهاتف).
* **حركات سلسة:** إدارة نوافذ وانتقالات ناعمة.

---

## 🛠️ البرامج والأدوات

| الفئة                           | المكون         |
| ------------------------------- | -------------- |
| **مدير النوافذ**                | Hyprland       |
| **شريط الحالة**                 | Waybar         |
| **الصدفة**                      | Zsh            |
| **الطرفية**                     | Kitty          |
| **مشغل التطبيقات**              | Rofi (Wayland) |
| **الإشعارات**                   | SwayNC         |
| **مؤشر الصوت على الشاشة (OSD)** | SwayOSD        |
| **قائمة تسجيل الخروج**          | wlogout        |
| **عارض الصوت**                  | Cava           |
| **إعدادات GTK**                 | nwg-look       |
| **الثيم**                       | Catppuccin     |
| **الخلفيات**                    | swww           |

---

## 🍧 إعداد Waybar

تفصيل كامل للوحدات المستخدمة في Waybar:

### ⬅️ الوحدات اليسرى

| اسم الوحدة            | النوع    | الوصف                                 |
| --------------------- | -------- | ------------------------------------- |
| `custom/power`        | مخصص 🛠️ | قائمة الطاقة / تسجيل الخروج (wlogout) |
| `custom/gh_heatmap`   | مخصص 🛠️ | نشاط GitHub (خريطة أسبوعية)           |
| `hyprland/workspaces` | مدمج 📦  | مبدّل مساحات العمل                    |
| `idle_inhibitor`      | مدمج 📦  | منع إطفاء الشاشة (وضع القهوة ☕)       |
| `custom/update`       | مخصص 🛠️ | تحديثات النظام (Pacman / AUR)         |

---

### ⏺️ الوحدات الوسطى

| اسم الوحدة            | النوع    | الوصف                                          |
| --------------------- | -------- | ---------------------------------------------- |
| `custom/colorpicker`  | مخصص 🛠️ | أداة التقاط ألوان الشاشة                       |
| `custom/hijri`        | مخصص 🛠️ | التاريخ الهجري (للمسلمين)                      |
| `clock`               | مدمج 📦  | الوقت والتاريخ الميلادي                        |
| `custom/privacy-dots` | مخصص 🛠️ | مؤشرات الخصوصية (الميكروفون، الكاميرا، الموقع) |
| `tray`                | مدمج 📦  | أيقونات شريط النظام                            |

---

### ➡️ الوحدات اليمنى

| اسم الوحدة            | النوع    | الوصف                       |
| --------------------- | -------- | --------------------------- |
| `mpris`               | مدمج 📦  | التحكم بمشغل الوسائط        |
| `custom/language`     | مخصص 🛠️ | مؤشر لغة لوحة المفاتيح      |
| `bluetooth`           | مدمج 📦  | حالة واتصال البلوتوث        |
| `network`             | مدمج 📦  | حالة الشبكة والواي فاي      |
| `custom/mobile`       | مخصص 🛠️ | مؤشر شحن الهاتف             |
| `battery`             | مدمج 📦  | مستوى البطارية              |
| `power-profiles`      | مدمج 📦  | أوضاع الطاقة (أداء / توفير) |
| `pulseaudio`          | مدمج 📦  | التحكم بالصوت               |
| `pulseaudio#mic`      | مدمج 📦  | التحكم بالميكروفون          |
| `custom/notification` | مخصص 🛠️ | فتح مركز الإشعارات (SwayNC) |

---

## 📂 البنية

* `~/.config/`: يحتوي على إعدادات Hyprland وWaybar وKitty وWlogout وRofi وغيرها.
* `~/.icons/`: حزم أيقونات النظام والمؤشر.
* `~/.themes/`: ثيمات GTK (Catppuccin).

---

## 🚀 التثبيت

> ⚠️ **ملاحظة:** قم بعمل نسخة احتياطية من إعداداتك الحالية قبل المتابعة حتى لا تفقد إعدادك الحالي.

1. **استنساخ المستودع:**

   ```bash
   git clone https://github.com/ahmed-x86/hyprland_dotfiles
   cd hyprland_dotfiles
   chmod +x *
   ./main.sh
   ```

تأكد من تثبيت جميع الحزم المذكورة في قسم "البرامج والأدوات" باستخدام pacman أو أي مساعد AUR تفضله مثل yay أو paru.

---

## 📸 المعرض

<div align="center">
<img src="screenshot_2026-02-07_10-21-48.png" width="48%" title="عرض سطح المكتب 1" />
<img src="screenshot_2026-02-07_17-03-54.png" width="48%" title="عرض سطح المكتب 2" />

<img src="screenshot_2026-02-07_19-22-20.png" width="48%" title="عرض سطح المكتب 3" />
<img src="screenshot_2026-02-07_19-23-34.png" width="48%" title="عرض سطح المكتب 4" />
</div>

---
