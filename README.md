# 🍙 My Hyprland Dotfiles

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-004450?style=for-the-badge&logo=hyprland&logoColor=white)

Welcome to my personal **Hyprland** configuration (dotfiles) on Arch Linux.

## 🛠️ Software & Tools

| Category | Component |
|----------|-----------|
| **Window Manager** | [Hyprland](https://hyprland.org/) |
| **Status Bar** | Waybar |
| **Shell** | Zsh |
| **Terminal** | Kitty |
| **App Launcher** | Rofi |
| **Notifications** | SwayNC |
| **OSD** | SwayOSD |
| **Logout Menu** | wlogout |
| **Audio Visualizer** | Cava |
| **GTK Settings** | nwg-look |
| **Theme** | Catppuccin |

<br>

## 🍧 Waybar Configuration

Here is a detailed breakdown of the modules used in my Waybar configuration:

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
| `custom/mobile` | **Custom** 🛠️ | [Mobile Charge Indicator](https://github.com/ahmed-x86/mobile_charge_indicator_waybar) |
| `battery` | Built-in 📦 | Battery Level & Status |
| `power-profiles` | Built-in 📦 | Power Profiles (Performance/Saver) |
| `pulseaudio` | Built-in 📦 | Volume Control |
| `pulseaudio#mic` | Built-in 📦 | Microphone Control |
| `custom/notification`| **Custom** 🛠️ | Notification Center Toggle (SwayNC) |

<br>

## 📸 Gallery

<div align="center">
  <img src="screenshot_2026-02-07_10-21-48.png" width="48%" title="Desktop View 1" />
  <img src="screenshot_2026-02-07_17-03-54.png" width="48%" title="Desktop View 2" />
  <br><br>
  <img src="screenshot_2026-02-07_19-22-20.png" width="48%" title="Desktop View 3" />
  <img src="screenshot_2026-02-07_19-23-34.png" width="48%" title="Desktop View 4" />
</div>

<br>

## 📂 Structure
- **.config/**: Contains configurations for Hyprland, Waybar, Kitty, etc.