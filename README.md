# Ücretsiz Apple Silicon Mac incelemesi

Bu küçük depo, GitHub Actions `macos-15` (M1) üzerinde resmi Vorssaint 3.4.1 DMG'sini indirir, SHA-256 değerini doğrular, uygulamayı açar, ikinci kez açarak menü panelini çağırır ve ekran görüntüsü ile REA kanıtını `vorssaint-macos-evidence` adlı Actions artifact'ine koyar.

## Çalıştırma

1. Bu klasörü ayrı bir **herkese açık** GitHub deposuna yükle. Büyük Windows ZIP'ini veya kişisel dosyaları ekleme.
2. Depoda **Actions → Vorssaint macOS evidence → Run workflow** seç.
3. İş bitince artifact ZIP'ini indir. `panel-screen.png`, `windows.tsv` ve varsa `panel-rea.json` dosyalarını Windows portuyla karşılaştır.

İş akışı henüz gerçek bir GitHub Mac çalıştırıcısında denenmedi; ilk koşuda açılış/onboarding veya izin davranışı nedeniyle panel görüntüsü alınamazsa workflow log'u ve artifact'e göre düzeltilecek. Çalıştırıcı geçicidir: uzak masaüstü olarak kalıcı bir Mac sağlamaz.
