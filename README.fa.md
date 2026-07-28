# صفحه اشتراک

یک قالب صفحه اشتراک واکنش‌گرا با پشتیبانی از چند زبان.

## زبان‌ها

`en` `fa` `zh` `ru`

## امکانات

- پشتیبانی از چند زبان با امکان تغییر زبان در رابط کاربری
- طراحی واکنش‌گرا
- حالت تاریک
- کد QR برای لینک‌های اتصال
- کپی لینک‌ها و کانفیگ‌ها با یک کلیک
- دانلود کانفیگ WireGuard به صورت فایل `.conf`
- شخصی‌سازی ظاهر با متغیرهای محیطی

## نصب

```bash
curl -fsSL https://raw.githubusercontent.com/AH-Foud/pasarguard-sub-custom/main/install.sh | sudo bash
```

## ساخت از سورس

```bash
git clone https://github.com/AH-Foud/pasarguard-sub-custom.git
cd pasarguard-sub-custom
bun install
bun run build
```

کپی به پنل:

```bash
sudo cp dist/index.html /var/lib/pasarguard/templates/subscription/index.html
pasarguard restart
```

## شخصی‌سازی

تنظیم در فایل `.env` و ساخت مجدد:

```env
VITE_PRIMARY_COLOR_LIGHT=oklch(0.48 0.11 250)
VITE_PRIMARY_COLOR_DARK=oklch(0.60 0.12 250)
VITE_BORDER_RADIUS=0.65rem
```
