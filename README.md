# Ücretsiz Apple Silicon Mac incelemesi

Bu küçük depo, GitHub Actions `macos-15` (M1) üzerinde resmi Vorssaint 3.4.1 DMG'sini indirir, SHA-256 değerini doğrular, uygulamayı açar, ikinci kez açarak menü panelini çağırır ve ekran görüntüsü ile REA kanıtını `vorssaint-macos-evidence` adlı Actions artifact'ine koyar.

## Çalıştırma

1. [Actions → Vorssaint macOS evidence](https://github.com/hannullsec/vorssaint-macos-probe-20261018/actions/workflows/probe.yml) sayfasında **Run workflow** seç.
2. İş bitince `vorssaint-macos-evidence` artifact'ini indir. `tab-0-awake.png` ile `tab-8-about.png` arasındaki dokuz ekran görüntüsü panelin gerçek sekmelerini gösterir.
3. `app.json` ve `dmg.json` REA paket incelemeleridir. `panel-rea.json` içindeki `window-mismatch` hatası native UI çağrısının başarılı olmadığını gösterir; ekran görüntüleri ayrı macOS çalışma zamanı kanıtıdır.

İş akışı 2026-10-18'de [39085410819 numaralı M1 koşusunda](https://github.com/hannullsec/vorssaint-macos-probe-20261018/actions/runs/39085410819) başarıyla çalıştı. macOS ekran yakalaması sırasında güncelleme tanıtım penceresi panelin arkasında kaldı. Çalıştırıcı geçicidir: uzak masaüstü olarak kalıcı bir Mac sağlamaz.
