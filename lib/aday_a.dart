import './puanturleri.dart';
import './testler.dart';

class AdayA {
  final Map ham = {
    'gy': 0,
    'gk': 0,
    'eg': 0,
    'hu': 0,
    'ik': 0,
    'is': 0,
    'ma': 0,
    'mu': 0,
    'ca': 0,
    'it': 0,
    'ka': 0,
    'ul': 0,
  };
  final Map stdPuan17 = {
    'gy': 0,
    'gk': 0,
    'eg': 0,
    'hu': 0,
    'ik': 0,
    'is': 0,
    'ma': 0,
    'mu': 0,
    'ca': 0,
    'it': 0,
    'ka': 0,
    'ul': 0,
  };
  final Map stdPuan18 = {
    'gy': 0,
    'gk': 0,
    'eg': 0,
    'hu': 0,
    'ik': 0,
    'is': 0,
    'ma': 0,
    'mu': 0,
    'ca': 0,
    'it': 0,
    'ka': 0,
    'ul': 0,
  };
  final Map stdPuan19 = {
    'gy': 0,
    'gk': 0,
    'eg': 0,
    'hu': 0,
    'ik': 0,
    'is': 0,
    'ma': 0,
    'mu': 0,
    'ca': 0,
    'it': 0,
    'ka': 0,
    'ul': 0,
  };
  final Map yanitlar;

  // 48 Puan Türü için bu listeler kullanılacak.

  var asp17 = new List<double>.filled(48, 0);
  var asp18 = new List<double>.filled(48, 0);
  var asp19 = new List<double>.filled(48, 0);

  var sonuc17 = new List<double>.filled(48, 0);
  var sonuc18 = new List<double>.filled(48, 0);
  var sonuc19 = new List<double>.filled(48, 0);
  List<String> tests = [
    'gy',
    'gk',
    'eg',
    'hu',
    'ik',
    'is',
    'ma',
    'mu',
    'ca',
    'it',
    'ka',
    'ul',
  ];
  AdayA(this.yanitlar);

  void hamPuanHesapla() {
    for (var item in tests) {
      ham[item] = yanitlar[item][0] - yanitlar[item][1] / 4;
      //print('$item: ${ham[item]}'); hampuanlar doğru hesaplanıyor
    }
    /*  ham['gy'] = yanitlar['gy'][0] - yanitlar['gy'][1] / 4;
    ham['gk'] = yanitlar['gk'][0] - yanitlar['gk'][1] / 4;
    ham['ka'] = yanitlar['ka'][0] - yanitlar['ka'][1] / 4;
    ham['ul'] = yanitlar['ul'][0] - yanitlar['ul'][1] / 4;
    ham['ca'] = yanitlar['ca'][0] - yanitlar['ca'][1] / 4;
    ham['hu'] = yanitlar['hu'][0] - yanitlar['hu'][1] / 4;
    ham['ik'] = yanitlar['ik'][0] - yanitlar['ik'][1] / 4;
    ham['ma'] = yanitlar['ma'][0] - yanitlar['ma'][1] / 4;
    ham['is'] = yanitlar['is'][0] - yanitlar['is'][1] / 4;
    ham['mu'] = yanitlar['mu'][0] - yanitlar['mu'][1] / 4;
    ham['it'] = yanitlar['it'][0] - yanitlar['it'][1] / 4;*/
  }

  void stdPuanHesapla() {
    for (var item in tests) {
      stdPuan17[item] =
          10 * ((ham[item] - test17[item].ortalama) / test17[item].stdSapma) +
              50;
      stdPuan18[item] =
          10 * ((ham[item] - test18[item].ortalama) / test18[item].stdSapma) +
              50;
      stdPuan19[item] =
          10 * ((ham[item] - test19[item].ortalama) / test19[item].stdSapma) +
              50;
      // print('stpPuan19 $item: ${stdPuan19[item]}'); // Hesaplama OK!
    }
    /*
    stdPuan17['gy'] =
        10 * ((ham['gy'] - genYet17.ortalama) / genYet17.stdSapma) + 50;
    stdPuan17['gk'] =
        10 * ((ham['gk'] - genKul17.ortalama) / genKul17.stdSapma) + 50;

    stdPuan18['gy'] =
        10 * ((ham['gy'] - genYet18.ortalama) / genYet18.stdSapma) + 50;
    stdPuan18['gk'] =
        10 * ((ham['gk'] - genKul18.ortalama) / genKul18.stdSapma) + 50;

    stdPuan19['gy'] =
        10 * ((ham['gy'] - genYet19.ortalama) / genYet19.stdSapma) + 50;
    stdPuan19['gk'] =
        10 * ((ham['gk'] - genKul19.ortalama) / genKul19.stdSapma) + 50;*/
  }

  void createASPSonuc(List kpss17, List kpss18, List kpss19) {
    // P1- P2- P3.... için for loop dönüyor. Her puan türü için bir asp gerekiyor.
    var _agirlikMatris = PuanTuruA.agirlikMatris;

    for (var i = 0; i < 48; i++) {
      for (var item in tests) {
        asp17[i] += (stdPuan17[item] * _agirlikMatris[i][item]);
        asp18[i] += (stdPuan18[item] * _agirlikMatris[i][item]);
        asp19[i] += (stdPuan19[item] * _agirlikMatris[i][item]);
      }
      //print('asp19 $i: ${asp19[i]}');
    }
/*
    for (var i = 0; i < 3; i++) {
      asp17[i] = stdPuan17['gy'] * kpss17[i].agirlik[0] +
          stdPuan17['gk'] * kpss17[i].agirlik[1];

      asp18[i] = stdPuan18['gy'] * kpss18[i].agirlik[0] +
          stdPuan18['gk'] * kpss18[i].agirlik[1];
      asp19[i] = stdPuan19['gy'] * kpss19[i].agirlik[0] +
          stdPuan19['gk'] * kpss19[i].agirlik[1];
    }*/
    for (var i = 0; i < 48; i++) {
      sonuc17[i] = double.parse(
          (70 + (30 * (2 * asp17[i] - kpss17[i].xs2) / kpss17[i].m))
              .toStringAsFixed(3));
      sonuc18[i] = double.parse(
          (70 + (30 * (2 * asp18[i] - kpss18[i].xs2) / kpss18[i].m))
              .toStringAsFixed(3));
      sonuc19[i] = double.parse(
          (70 + (30 * (2 * asp19[i] - kpss19[i].xs2) / kpss19[i].m))
              .toStringAsFixed(3));
      //print('sonuc19 ${i + 1}: ${sonuc19[i]}'); // Hesaplama OK!
    }
  }
}
