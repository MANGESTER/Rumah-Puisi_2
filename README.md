# Rumah Puisi (versi Node.js)

## Menjalankan di komputer
Butuh Node.js 18 atau lebih baru (cek: `node -v`). Tidak perlu `npm install`.

- Mac/Linux:       ADMIN_PASSWORD="sandi-anda" node server.js
- Windows PowerShell: $env:ADMIN_PASSWORD="sandi-anda"; node server.js
- Windows CMD:     set ADMIN_PASSWORD=sandi-anda && node server.js
- VS Code:         tekan F5 (kata sandi lokal ada di .vscode/launch.json)

Buka http://localhost:3000. Setelah mengubah server.js atau public/index.html,
matikan server (Ctrl+C), jalankan lagi, lalu muat ulang browser (Ctrl+Shift+R).

## Variabel lingkungan
ADMIN_PASSWORD  wajib, minimal 8 karakter
PORT            opsional, bawaan 3000
DATA_DIR        opsional, folder penyimpanan poems.json (bawaan: ./data)
SESSION_SECRET  opsional, agar login admin tidak terlogout saat server restart

## Hosting
Gunakan hosting yang menjalankan server Node.js (Render, Railway, Fly.io, VPS).
Pasang disk permanen dan arahkan DATA_DIR ke sana agar puisi tidak hilang.
Vercel dan GitHub Pages tidak cocok untuk versi ini (pakai versi statis + Supabase).