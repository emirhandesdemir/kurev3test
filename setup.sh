#!/bin/bash

echo "🚀 KÜRE Otomatik Kurulum Başlatılıyor..."

# 1. Node.js ve Git kontrolü
if ! command -v node &> /dev/null; then
    echo "⚠️ Node.js yüklü değil. Lütfen yükleyin ve tekrar deneyin."
    exit
fi

if ! command -v git &> /dev/null; then
    echo "⚠️ Git yüklü değil. Lütfen yükleyin ve tekrar deneyin."
    exit
fi

# 2. Ana dizine geç
cd ~/kurev3test || exit
echo "📁 Ana dizine geçildi: $(pwd)"

# 3. Admin Panel ve App için klasörlere gir
cd yönetici-paneli || exit
echo "🛠️ Admin Panel Kurulumu Başladı"
npm install
cd ..

cd uygulama || exit
echo "📱 Kullanıcı Uygulaması Kurulumu Başladı"
npm install
cd ..

# 4. Ortak Firebase ayar dosyasını oluştur
echo "🧩 Firebase yapılandırma dosyası oluşturuluyor..."

cat <<EOF > ./firebase.js
// Firebase Otomatik Kurulum (setup.sh tarafından oluşturuldu)
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

const firebaseConfig = {
  apiKey: "AIzaSyCSQK339WbGgwLmEEe_fW3FZ2X9vDyHN6I",
  authDomain: "kurev3-df3da.firebaseapp.com",
  projectId: "kurev3-df3da",
  storageBucket: "kurev3-df3da.appspot.com",
  messagingSenderId: "646801782656",
  appId: "1:646801782656:web:a9b7dbf250d5914ba2f365",
  measurementId: "G-Q9ZNBLW82R"
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export default app;
EOF

echo "✅ firebase.js başarıyla oluşturuldu."

# 5. firebase.js dosyasını ilgili klasörlere kopyala
cp firebase.js yönetici-paneli/src/firebase.js
cp firebase.js uygulama/src/firebase.js
echo "📦 firebase.js tüm modüllere kopyalandı."

# 6. Bilgilendirme
echo ""
echo "🎉 Kurulum Tamamlandı!"
echo "📍 Admin panel başlatmak için: cd ~/kurev3test/yönetici-paneli && npm run dev"
echo "📍 Kullanıcı uygulamasını başlatmak için: cd ~/kurev3test/uygulama && npm run dev"