<div align="center">

[**🇸🇦 العربية**](./README_AR.md) | **🇺🇸 English**

</div>

---

<div align="center">
  <h1>🍙 My Hyprland Dotfiles</h1>
  <p><i>A minimal, highly customized, and functional Hyprland setup on Arch Linux.</i></p>

  ![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
  ![Hyprland](https://img.shields.io/badge/Hyprland-004450?style=for-the-badge&logo=hyprland&logoColor=white)
  ![Waybar](https://img.shields.io/badge/Waybar-292D3E?style=for-the-badge)
  ![Kitty](https://img.shields.io/badge/Kitty-504945?style=for-the-badge&logo=gnome-terminal&logoColor=white)
  ![Zsh](https://img.shields.io/badge/Zsh-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
  ![Catppuccin](https://img.shields.io/badge/Catppuccin-F8BD96?style=for-the-badge)
</div>
<br>

Welcome to my personal **Hyprland** configuration (dotfiles). This setup is designed to be aesthetically pleasing, utilizing the Catppuccin color palette, while maintaining high performance and practical daily usability.

## ✨ Features
- **Fast & Lightweight:** Built on top of Arch Linux with the Hyprland Wayland compositor.
- **Aesthetic UI:** Consistent Catppuccin theme integration across the system, GTK apps, and terminal.
- **Advanced Waybar:** Highly modular status bar with bespoke custom modules (Hijri calendar, dynamic privacy dots, GitHub heatmap, mobile charge indicator).
- **Smooth Animations:** Fluid window management and transitions.

## 🛠️ Software & Tools

| Category | Component |
|----------|-----------|
| **Window Manager** | [Hyprland](https://hyprland.org/) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) |
| **Shell** | [Zsh](https://www.zsh.org/) |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| **App Launcher** | [Rofi (Wayland)](https://github.com/lbonn/rofi-wayland) |
| **Notifications** | [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) |
| **OSD** | [SwayOSD](https://github.com/ErikReider/SwayOSD) |
| **Logout Menu** | [wlogout](https://github.com/ArtsyMacaw/wlogout) |
| **Audio Visualizer** | [Cava](https://github.com/karlstav/cava) |
| **GTK Settings** | [nwg-look](https://github.com/nwg-piotr/nwg-look) |
| **Theme** | [Catppuccin](https://github.com/catppuccin/catppuccin) |
| **Wallpaper** | [swww](https://github.com/LGFae/swww) |
<br>

## 🍧 Waybar Configuration

Here is a detailed breakdown of the modules used in my Waybar setup:

### ⬅️ Left Modules
| Module Name | Type | Description |
| :--- | :--- | :--- |
| `custom/power` | **Custom** 🛠️ | Power Menu / Logout (wlogout) |
| `custom/gh_heatmap` | **Custom** 🛠️ | [GitHub Activity](https://github.com/ad1822/weekly-github-waybar-module/tree/dev) (Weekly Heatmap) |
| `hyprland/workspaces`| Built-in 📦 | Workspace Switcher |
| `idle_inhibitor` | Built-in 📦 | Toggle to keep screen awake (Coffee Mode) |
| `custom/update` | **Custom** 🛠️ | System Updates (Pacman/AUR) |

### ⏺️ Center Modules
| Module Name | Type | Description |
| :--- | :--- | :--- |
| `custom/colorpicker` | **Custom** 🛠️ | Screen Color Picker Tool |
| `custom/hijri` | **Custom** 🛠️ | Hijri Calendar Date (**For Muslims**) |
| `clock` | Built-in 📦 | Time & Gregorian Date |
| `custom/privacy-dots`| **Custom** 🛠️ | [Privacy Dots (Mic, Camera, Location)](https://github.com/alvaniss/privacy-dots) |
| `tray` | Built-in 📦 | System Tray Icons |

### ➡️ Right Modules
| Module Name | Type | Description |
| :--- | :--- | :--- |
| `mpris` | Built-in 📦 | Media Player Controls |
| `custom/language` | **Custom** 🛠️ | Keyboard Layout Indicator |
| `bluetooth` | Built-in 📦 | Bluetooth Status & Connection |
| `network` | Built-in 📦 | Network & Wi-Fi Status |
| `battery` | Built-in 📦 | Battery Level & Status |
| `power-profiles` | Built-in 📦 | Power Profiles (Performance/Saver) |
| `pulseaudio` | Built-in 📦 | Volume Control |
| `pulseaudio#mic` | Built-in 📦 | Microphone Control |
| `custom/notification`| **Custom** 🛠️ | Notification Center Toggle (SwayNC) |

<br>

## 📂 Structure

- `~/.config/`: Contains configurations for Hyprland, Waybar, Kitty, Wlogout, Rofi, and other apps.
- `~/.icons/`: Custom system and cursor icon packs.
- `~/.themes/`: GTK themes (Catppuccin).

<br>

## 🚀 Installation

> **⚠️ Note:** Please back up your existing configurations before proceeding to avoid losing your current setup.

You can install these dotfiles using either the **Online** (One-Command) method or the **Offline** (Manual) method. Choose whichever suits you best!

### 🌐 Method 1: Online Install 
The fastest way to get everything up and running. Just paste this single command into your terminal:
#### It's not complete yet.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ahmed-x86/hyprland_dotfiles/refs/heads/main/online-install.sh )" 
```

### 📦 Method 2: Offline Install (Recommended)

If you prefer to clone the repository manually and inspect the scripts before running them:

Clone the repository

then Make the scripts executable and run the installer:

```Bash
git clone https://github.com/ahmed-x86/hyprland_dotfiles
cd hyprland_dotfiles

chmod +x *
./main.sh
```

📸 Gallery

<div align="center">
<img src="screenshot_2026-02-07_10-21-48.png" width="48%" title="Desktop View 1" />
<img src="screenshot_2026-02-07_17-03-54.png" width="48%" title="Desktop View 2" />


<img src="screenshot_2026-02-07_19-22-20.png" width="48%" title="Desktop View 3" />
<img src="screenshot_2026-02-07_19-23-34.png" width="48%" title="Desktop View 4" />
</div>
---