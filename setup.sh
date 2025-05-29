#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 KÜRE Otomatik Kurulum Başlatılıyor..."

# Ana dizine geç
cd $HOME/kurev3test || exit
echo "📁 Ana dizine geçildi: $(pwd)"

# Admin Panel Kurulumu
echo "🛠️ [1/3] Admin panel kuruluyor..."
git clone https://github.com/emirhandesdemir/kurev3test.git yönetici-paneli
cd yönetici-paneli || { echo "❌ Admin panel dizini bulunamadı."; exit 1; }
npm install || { echo "❌ Admin panel bağımlılık kurulumu başarısız."; exit 1; }
echo "✅ Admin panel kuruldu."
cd ..

# Mobil Uygulama Kurulumu
echo "📱 [2/3] Mobil uygulama kuruluyor..."
git clone https://github.com/emirhandesdemir/Kuremobileapp.git mobil-uygulama
cd mobil-uygulama || { echo "❌ Mobil uygulama dizini bulunamadı."; exit 1; }
npm install || { echo "❌ Mobil uygulama bağımlılık kurulumu başarısız."; exit 1; }
echo "✅ Mobil uygulama kuruldu."
cd ..

# Bot Sistemi Kurulumu
echo "🤖 [3/3] Bot sistemi kuruluyor..."
git clone https://github.com/emirhandesdemir/Kuremobile.git bot-sistemi
cd bot-sistemi || { echo "❌ Bot sistemi dizini bulunamadı."; exit 1; }
npm install || { echo "❌ Bot sistemi bağımlılık kurulumu başarısız."; exit 1; }
echo "✅ Bot sistemi kuruldu."
cd ..

echo "🎉 Tüm sistem başarıyla kuruldu. Hazırsınız!"
