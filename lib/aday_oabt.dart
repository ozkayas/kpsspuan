class AdayOABT {
  final Map ham = {
    'gy': 0,
    'gk': 0,
    'eg': 0,
    'al': 0,
  };
  final Map stdPuan19 = {
    'gy': 0,
    'gk': 0,
    'eg': 0,
    'al': 0,
  };
  final Map yanitlar; // object yaratılırken form sayfasından geliyor
  final String myOABT; // object yaratılırken form sayfasından geliyor

  // 5 Puan Türü için bu listeler kullanılacak. p1-p2-p3-p10-p121alan

  //var asp17 = new List<double>.filled(5, 0);
  //var asp18 = new List<double>.filled(5, 0);
  var asp19 = new List<double>.filled(5, 0);

  //var sonuc17 = new List<double>.filled(5, 0);
  //var sonuc18 = new List<double>.filled(5, 0);
  var sonuc19 = new List<double>.filled(5, 0);
  List<String> tests = [
    'gy',
    'gk',
    'eg',
    'al',
  ];
  AdayOABT(this.yanitlar, this.myOABT);

  Map testoabt19 = {
    'gy': {'ortalama': 21.440, 'stdSapma': 8.67800},
    'gk': {'ortalama': 21.840, 'stdSapma': 10.62900},
    'eg': {'ortalama': 33.604, 'stdSapma': 12.91200},
    'al': {'ortalama': 1, 'stdSapma': 1},
    // 'al': {} kulanıcının seçtiği oabt test tipine göre stdPuanHesapla metodu içinde atama yapılaca
  };
  Map alHavuzOrtalamaStdSapma = {
    'Türkçe': {'ortalama': 48.424, 'stdSapma': 10.196},
    'İlköğretim Matematik': {'ortalama': 30.693, 'stdSapma': 10.425},
    'Fen Bilimleri/Fen ve Teknoloji': {'ortalama': 24.496, 'stdSapma': 8.373},
    'Sosyal Bilgiler': {'ortalama': 37.551, 'stdSapma': 11.579},
    'Türk Dili ve Edebiyatı': {'ortalama': 27.951, 'stdSapma': 13.867},
    'Tarih': {'ortalama': 32.482, 'stdSapma': 13.628},
    'Coğrafya': {'ortalama': 35.347, 'stdSapma': 12.424},
    'Matematik(Lise)': {'ortalama': 24.268, 'stdSapma': 12.425},
    'Fizik': {'ortalama': 32.032, 'stdSapma': 15.711},
    'Kimya': {'ortalama': 28.278, 'stdSapma': 14.364},
    'Biyoloji': {'ortalama': 25.229, 'stdSapma': 10.802},
    'Din Kültürü': {'ortalama': 42.599, 'stdSapma': 11.592},
    'Yabancı Dil': {'ortalama': 33.863, 'stdSapma': 14.283},
    'Rehber Öğretmen': {'ortalama': 50.568, 'stdSapma': 11.481},
    'Sınıf Öğretmenliği': {'ortalama': 32.434, 'stdSapma': 8.823},
    'Okul Öncesi Öğretmenliği': {'ortalama': 37.382, 'stdSapma': 10.578},
    'Beden Eğitimi Öğretmenliği': {'ortalama': 26.514, 'stdSapma': 8.256},
    'İmam-Hatip Lisesi Meslek Dersleri': {
      'ortalama': 38.082,
      'stdSapma': 10.353
    },
  };

  List kpssoabt19 = [
    {'m': 66.67118182, 'xs2': 108.2876284},
    {'m': 63.25503785, 'xs2': 108.0270821},
    {'m': 59.66054532, 'xs2': 107.9451944},
    {'m': 51.07062419, 'xs2': 110.2950671},
    {
      'm': 68.91751217,
      'xs2': 110.1382208
    } // kulanıcının seçtiği oabt test tipine göre createASPSonuc metodu içinde atama yapılacak.
  ];

  Map alHavuzMXS2 = {
    'Türkçe': {'m': 68.91751217, 'xs2': 110.1382208},
    'İlköğretim Matematik': {'m': 68.91056739, 'xs2': 110.1413168},
    'Fen Bilimleri/Fen ve Teknoloji': {'m': 68.90639875, 'xs2': 110.140448},
    'Sosyal Bilgiler': {'m': 68.9086608, 'xs2': 110.1416353},
    'Türk Dili ve Edebiyatı': {'m': 68.9070996, 'xs2': 110.1417187},
    'Tarih': {'m': 68.90823199, 'xs2': 110.1414031},
    'Coğrafya': {'m': 1, 'xs2': 1},
    'Matematik(Lise)': {'m': 1, 'xs2': 1},
    'Fizik': {'m': 1, 'xs2': 1},
    'Kimya': {'m': 1, 'xs2': 1},
    'Biyoloji': {'m': 1, 'xs2': 1},
    'Din Kültürü': {'m': 68.90745208, 'xs2': 110.1409831},
    'Yabancı Dil': {'m': 68.9078393, 'xs2': 110.1417042},
    'Rehber Öğretmen': {'m': 68.91001531, 'xs2': 110.1408563},
    'Sınıf Öğretmenliği': {'m': 68.90971545, 'xs2': 110.1415646},
    'Okul Öncesi Öğretmenliği': {'m': 68.90777966, 'xs2': 110.1413969},
    'Beden Eğitimi Öğretmenliği': {'m': 68.91995754, 'xs2': 110.1386813},
    'İmam-Hatip Lisesi Meslek Dersleri': {'m': 68.90934097, 'xs2': 110.1410671},
  };

  void hamPuanHesapla() {
    for (var item in tests) {
      ham[item] = yanitlar[item][0] - yanitlar[item][1] / 4;
      //print('$item: ${ham[item]}'); //hampuanlar doğru hesaplanıyor
    }
  }

  void stdPuanHesapla() {
    // Hesaplara başlamadan önce, kullanıcının dropdown form dan seçtiği alana göre testoabt19 'al':ortalama&stdSapma'yı atama yapıyor.
    testoabt19['al'] = alHavuzOrtalamaStdSapma[myOABT];

    for (var item in tests) {
      stdPuan19[item] = 10 *
              ((ham[item] - testoabt19[item]['ortalama']) /
                  testoabt19[item]['stdSapma']) +
          50;
      //print('stpPuan19 $item: ${stdPuan19[item]}'); // Hesaplama OK!
    }
  }

  void createASPSonuc() {
    // P1- P2- P3 - P10 _P121 için bir asp gerekiyor.

    asp19[0] = (stdPuan19['gy'] * 0.7 +
        stdPuan19['gk'] * 0.3 +
        stdPuan19['eg'] * 0 +
        stdPuan19['al'] * 0);
    asp19[1] = (stdPuan19['gy'] * 0.6 +
        stdPuan19['gk'] * 0.4 +
        stdPuan19['eg'] * 0 +
        stdPuan19['al'] * 0);
    asp19[2] = (stdPuan19['gy'] * 0.5 +
        stdPuan19['gk'] * 0.5 +
        stdPuan19['eg'] * 0 +
        stdPuan19['al'] * 0);
    asp19[3] = (stdPuan19['gy'] * 0.3 +
        stdPuan19['gk'] * 0.3 +
        stdPuan19['eg'] * 0.4 +
        stdPuan19['al'] * 0);
    asp19[4] = (stdPuan19['gy'] * 0.15 +
        stdPuan19['gk'] * 0.15 +
        stdPuan19['eg'] * 0.2 +
        stdPuan19['al'] * 0.5);

    //print('asp19 $i: ${asp19[i]}');

    for (var i = 0; i < 5; i++) {
      sonuc19[i] = double.parse((70 +
              (30 * (2 * asp19[i] - kpssoabt19[i]['xs2']) / kpssoabt19[i]['m']))
          .toStringAsFixed(3));
      //print('sonuc19 ${i + 1}: ${sonuc19[i]}'); // Hesaplama OK!
    }
  }
}
