import './puanturleri.dart';
import './testler.dart';

class AdayB {
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

  var asp17 = new List<double>.filled(3, 0);
  var asp18 = new List<double>.filled(3, 0);
  var asp19 = new List<double>.filled(3, 0);
/*

  List<double> asp17 = [1, 2, 3];
  List<double> asp18 = [1, 2, 3];
  List<double> asp19 = [1, 2, 3];
*/
  List<double> sonuc17 = [0, 0, 0];
  List<double> sonuc18 = [0, 0, 0];
  List<double> sonuc19 = [0, 0, 0];

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
  AdayB(this.yanitlar);

  void hamPuanHesapla() {
    ham['gy'] = yanitlar['gy'][0] - yanitlar['gy'][1] / 4;
    ham['gk'] = yanitlar['gk'][0] - yanitlar['gk'][1] / 4;
  }

  void stdPuanHesapla() {
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
        10 * ((ham['gk'] - genKul19.ortalama) / genKul19.stdSapma) + 50;
  }

  void createASPSonuc(List kpss17, List kpss18, List kpss19) {
    var _agirlikMatris = PuanTuruA.agirlikMatris;

    for (var i = 0; i < 3; i++) {
      for (var item in tests) {
        asp17[i] += (stdPuan17[item] * _agirlikMatris[i][item]);
        asp18[i] += (stdPuan18[item] * _agirlikMatris[i][item]);
        asp19[i] += (stdPuan19[item] * _agirlikMatris[i][item]);
      }
    }
/*    for (var i = 0; i < 3; i++) {
      asp17[i] = stdPuan17['gy'] * kpss17[i].agirlik[0] +
          stdPuan17['gk'] * kpss17[i].agirlik[1];
      asp18[i] = stdPuan18['gy'] * kpss18[i].agirlik[0] +
          stdPuan18['gk'] * kpss18[i].agirlik[1];
      asp19[i] = stdPuan19['gy'] * kpss19[i].agirlik[0] +
          stdPuan19['gk'] * kpss19[i].agirlik[1];
    }*/
    for (var i = 0; i < 3; i++) {
      sonuc17[i] = double.parse(
          (70 + (30 * (2 * asp17[i] - kpss17[i].xs2) / kpss17[i].m))
              .toStringAsFixed(3));
      sonuc18[i] = double.parse(
          (70 + (30 * (2 * asp18[i] - kpss18[i].xs2) / kpss18[i].m))
              .toStringAsFixed(3));
      sonuc19[i] = double.parse(
          (70 + (30 * (2 * asp19[i] - kpss19[i].xs2) / kpss19[i].m))
              .toStringAsFixed(3));
    }
  }
}
