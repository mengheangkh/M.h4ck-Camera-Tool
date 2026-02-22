# 📸 M.h4ck Camera Tool

<p align="center">
  <img src="https://img.shields.io/badge/Version-2.0-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform-Termux-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Author-Heang_Cyber-red?style=for-the-badge" />
</p>

<p align="center">
  <b>Advanced Camera Tracking Tool for Termux</b><br>
  High-level camera tracking tool for Termux
</p>

---

## 📱 About Tool

**M.h4ck Camera Tool** is a tool that allows you to create a URL to track a target's camera.  
When the target opens this URL, you will receive notifications via :contentReference[oaicite:0]{index=0}.

---

## ✨ Features

- 🔗 Create a personal Tracking URL  
- 📲 Receive notifications via Telegram  
- 🎨 Clean and user-friendly UI  
- 📋 Automatically copy URL  
- 🌐 Open Telegram directly  
- ⚡ Fast, efficient, and reliable  

---

## 🔧 Installation

### 📌 Prerequisites

- Termux (F‑Droid or Play Store)  
- Internet connection  

### ⚙️ Installation Steps

```bash
# 1. Update packages
pkg update && pkg upgrade -y

# 2. Install git
pkg install git -y

# 3. Clone repository
git clone https://github.com/mengheangkh/M.h4ck-Camera-Tool.git

# 4. Go to directory
cd mh4ck-camera

# 5. Give permission
chmod +x install.sh

# 6. Run termux-api
pkg install termux-api

# 7. Run installation
./install.sh

# 8. Run Comment
mh4ck