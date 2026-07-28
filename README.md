# Subscription Page

A responsive subscription page template with multi-language support.

## Languages

`en` `fa` `zh` `ru`

## Features

- Multi-language with UI language switcher
- Responsive layout
- Dark mode
- QR code for connection links
- Copy links/configs in one click
- WireGuard config download as `.conf`
- Appearance customization via env vars

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/AH-Foud/pasarguard-sub-custom/main/install.sh | sudo bash
```

## Build From Source

```bash
git clone https://github.com/AH-Foud/pasarguard-sub-custom.git
cd pasarguard-sub-custom
bun install
bun run build
```

Copy to panel:

```bash
sudo cp dist/index.html /var/lib/pasarguard/templates/subscription/index.html
pasarguard restart
```

## Customization

Set in `.env` and rebuild:

```env
VITE_PRIMARY_COLOR_LIGHT=oklch(0.48 0.11 250)
VITE_PRIMARY_COLOR_DARK=oklch(0.60 0.12 250)
VITE_BORDER_RADIUS=0.65rem
```
