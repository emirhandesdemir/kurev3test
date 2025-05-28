#!/bin/bash

echo "🚀 KÜRE Otomatik Kurulum Başlatılıyor..."

# Ana dizine git
cd ~/kurev3test || exit
echo "📁 Ana dizine geçildi: $(pwd)"

# Yönetici paneli klasörü yoksa oluştur
if [ ! -d "yönetici-paneli" ]; then
  echo "📦 Yönetici paneli klasörü oluşturuluyor..."
  mkdir yönetici-paneli
fi

cd yönetici-paneli || exit
echo "📁 Yönetici paneli dizinine girildi."

# Önceden klonlanmışsa sil
if [ -d "admin-panel" ]; then
  echo "🧹 Eski admin-panel klasörü siliniyor..."
  rm -rf admin-panel
fi

# Admin panelini GitHub'dan klonla
echo "🔽 Admin paneli klonlanıyor..."
git clone https://github.com/emirhandesdemir/kure-admin-panel.git admin-panel

# NPM bağımlılıklarını yükle
cd admin-panel || exit
echo "📦 npm install başlatılıyor..."
npm install

echo ""
echo "✅ Kurulum tamamlandı! Paneli çalıştırmak için:"
echo "---------------------------------------------"
echo "cd ~/kurev3test/yönetici-paneli/admin-panel"
echo "npm run dev"
echo "---------------------------------------------"
