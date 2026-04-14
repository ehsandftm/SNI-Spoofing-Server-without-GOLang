![GitHub License](https://img.shields.io/github/license/ehsandftm/SNI-Spoofing-Server-without-GOLang?style=flat-square\&color=blue)
![GitHub Stars](https://img.shields.io/github/stars/ehsandftm/SNI-Spoofing-Server-without-GOLang?style=flat-square\&color=yellow)
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey?style=flat-square\&logo=linux)
![Language](https://img.shields.io/badge/Language-Bash-green?style=flat-square\&logo=gnu-bash)

# 🚀 SNI Spoofing Server (No GoLang Required)

### پیاده‌سازی سبک و قابل حمل SNI Spoofing بدون نیاز به GoLang

A portable implementation of **patterniha's SNI-Spoofing DPI bypass technique**
این پروژه یک پیاده‌سازی سبک از تکنیک **دور زدن DPI با SNI Spoofing** است.

> ⚠️ All credits for the original idea belong to **@patterniha**

---

## 🇮🇷 توضیحات فارسی

این ابزار برای اجرای تکنیک **SNI Spoofing** بدون نیاز به GoLang یا Rust طراحی شده و مناسب محیط‌های محدود (مثل سرورهای ایران) است.

---

## 🚀 Quick Install (Iran Servers) | نصب سریع برای سرورهای ایران

Since GitHub access may be restricted on some Iranian servers, you can use the manual method.

از آنجایی که دسترسی به گیت‌هاب در برخی سرورهای ایران محدود است، پیشنهاد می‌شود از روش دستی استفاده کنید:

```bash
# Copy all content from install.sh and run it
```

تمام کدهای داخل فایل `install.sh` را کپی کرده و در ترمینال اجرا کنید.

---

## 🛠 Installation Methods | روش‌های نصب

### 🔹 Method 1: Direct Command (If GitHub is accessible)

```bash
curl -L https://raw.githubusercontent.com/ehsandftm/SNI-Spoofing-Server-without-GOLang/main/install.sh -o install.sh && chmod +x install.sh && ./install.sh
```

---

### 🔹 Method 2: Manual Copy/Paste (Recommended for Iran)

1. Open `install.sh`
2. Copy all content
3. Paste in terminal and press Enter

---

## 📱 Management | مدیریت

After installation, simply type:

```bash
sni
```

برای مدیریت سرویس، فقط دستور زیر را اجرا کنید:

```bash
sni
```

### Available Options:

* **Show Status** → وضعیت سرویس
* **Configuration** → تنظیم IP و SNI
* **Live Logs** → مشاهده لاگ زنده

---

## ✨ Features | ویژگی‌ها

* ⚡ **No Dependencies** → بدون نیاز به GoLang یا Rust
* 🌐 **Internal Network Ready** → مناسب شبکه‌های محدود
* 📡 **Ping Test** → تست خودکار اتصال هنگام نصب
* 🧩 **Simple CLI Manager** → مدیریت آسان با دستور `sni`

---

## 🧠 How It Works

This tool uses **SNI Spoofing** to bypass DPI restrictions by manipulating TLS handshake behavior.

این ابزار با تغییر رفتار handshake در TLS، محدودیت‌های DPI را دور می‌زند.

---

## 📌 Use Cases

* Bypass DPI restrictions
* Deploy on restricted VPS
* Lightweight alternative to heavy implementations

---

## 🛠 Tech Stack

* **Language:** Bash
* **Core Idea:** SNI Spoofing
* **Deployment:** Linux Servers

---

## 🙏 Credits

This project is based on the original work:

* **Original Concept:** @patterniha
* **Bash Implementation & Optimization:** @ehsandftm

---

## ☕ Support the Project | حمایت از پروژه

If you find this project useful, you can support it:

اگر این پروژه برات مفید بوده، می‌تونی حمایت کنی:

### 💰 TRON (TRC20)

```
TFJ6ucBpZ6KghntTq9W3eadnN8gPCqgF3T
```

* **Network:** TRON (TRC20)
* **Supported:** TRX / USDT

---

🙏 Your support helps keep this project alive.
🙏 حمایت شما باعث ادامه پروژه خواهد شد.

---

*Developed with ❤️ for a free and open internet*
حقوق معنوی این پروژه برای من محفوظ است.
