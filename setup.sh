#!/bin/bash

echo "🚀 KÜRE Tüm Sistem Otomatik Kurulumu Başlatılıyor..."

cd ~/kurev3test || exit
echo "📁 Ana dizine geçildi: $(pwd)"

# === Admin Paneli Kurulumu ===
echo "🔧 [1/3] Yönetici paneli kuruluyor..."
if [ ! -d "yönetici-paneli" ]; then
  mkdir yönetici-paneli
fi

cd yönetici-paneli
rm -rf admin-panel
git clone https://github.com/emirhandesdemir/kure-admin-panel.git admin-panel
cd admin-panel
npm install
cd ../..

# === Mobil Uygulama Kurulumu ===
echo "📱 [2/3] Mobil uygulama kuruluyor..."
if [ ! -d "mobil-uygulama" ]; then
  mkdir mobil-uygulama
fi

cd mobil-uygulama
rm -rf kure-app
git clone https://github.com/emirhandesdemir/kure-mobile-app.git kure-app
cd kure-app
npm install
cd ../..

# === Bot Sistemi Kurulumu ===
echo "🤖 [3/3] Bot sistemi kuruluyor..."
if [ ! -d "bot-sistemi" ]; then
  mkdir bot-sistemi
fi

cd bot-sistemi
rm -rf kure-bot
git clone https://github.com/emirhandesdemir/kure-bot.git kure-bot
cd kure-bot
npm install
cd ../..

# === Kurulum Tamamlandı ===
echo ""
echo "✅ Tüm sistem başarıyla kuruldu!"
echo ""
echo "📂 Yönetici paneli başlatmak için:"
echo "cd ~/kurev3test/yönetici-paneli/admin-panel && npm run dev"
echo ""
echo "📂 Mobil uygulamayı başlatmak için:"
echo "cd ~/kurev3test/mobil-uygulama/kure-app && npm run start"
echo ""
echo "📂 Bot sistemini başlatmak için:"
echo "cd ~/kurev3test/bot-sistemi/kure-bot && npm run start"
echo ""
