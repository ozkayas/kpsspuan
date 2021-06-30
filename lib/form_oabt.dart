import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './aday_oabt.dart';
import './hesap_oabt.dart';

class FormPageOABT extends StatefulWidget {
  @override
  _FormPageOABTState createState() => _FormPageOABTState();
}

class _FormPageOABTState extends State<FormPageOABT> {
  GlobalKey<FormState> _formKey = new GlobalKey();
  String _myOABT; // kullanıcının seçtiği oabt alan testi

  //Dummy aday yaratılıyor
  AdayOABT aday = AdayOABT({
    'gy': [0, 0],
    'gk': [0, 0],
    'eg': [0, 0],
    'al': [0, 0],
  }, '');

/*   _handleSubmit : validator koşullarını kontrol ediyor (60dan küçükmü) ve input değerlerini yanitlara veriyor, user datasını
   güncelliyor ve setState ile ekranı güncelliyor*/

  void _handleSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        aday = AdayOABT(aday.yanitlar, _myOABT);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HesapOABT(aday)));
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text('Fazla Soru Girdiniz! \n    veya \nAlan Seçmediniz!'),
          );
        },
      );
    }
  }

  final _datasource = [
    {
      "display": "Türkçe",
      "value": "Türkçe",
    },
    {
      "display": "İlköğretim Matematik",
      "value": "İlköğretim Matematik",
    },
    {
      "display": "Fen Bilimleri/Fen ve Teknoloji",
      "value": "Fen Bilimleri/Fen ve Teknoloji",
    },
    {
      "display": "Sosyal Bilgiler",
      "value": "Sosyal Bilgiler",
    },
    {
      "display": "Türk Dili ve Edebiyatı",
      "value": "Türk Dili ve Edebiyatı",
    },
    {
      "display": "Tarih",
      "value": "Tarih",
    },
    {
      "display": "Coğrafya",
      "value": "Coğrafya",
    },
    {
      "display": "Matematik(Lise)",
      "value": "Matematik(Lise)",
    },
    {
      "display": "Fizik",
      "value": "Fizik",
    },
    {
      "display": "Kimya",
      "value": "Kimya",
    },
    {
      "display": "Biyoloji",
      "value": "Biyoloji",
    },
    {
      "display": "Din Kültürü",
      "value": "Din Kültürü",
    },
    {
      "display": "Yabancı Dil",
      "value": "Yabancı Dil",
    },
    {
      "display": "Rehber Öğretmen",
      "value": "Rehber Öğretmen",
    },
    {
      "display": "Sınıf Öğretmenliği",
      "value": "Sınıf Öğretmenliği",
    },
    {
      "display": "Okul Öncesi Öğretmenliği",
      "value": "Okul Öncesi Öğretmenliği",
    },
    {
      "display": "Beden Eğitimi Öğretmenliği",
      "value": "Beden Eğitimi Öğretmenliği",
    },
    {
      "display": "İmam-Hatip Lisesi Meslek Dersleri",
      "value": "İmam-Hatip Lisesi Meslek Dersleri",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ÖABT FORM'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                DropDownFormField(
                  titleText: 'Alan Bilgisi Seçiniz',
                  hintText: '---',
                  value: _myOABT,
                  validator: (value) {
                    return (value == null) ? 'Lütfen ÖABT Alanı Seçiniz' : null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _myOABT = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myOABT = value;
                    });
                  },
                  dataSource: _datasource,
                  textField: 'display',
                  valueField: 'value',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Genel Yetenek',
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            return (input.isNotEmpty &&
                                    num.tryParse(input) > 60)
                                ? 'Max:60'
                                : null;
                          },
                          onSaved: (String input) {
                            aday.yanitlar['gy'][0] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isNotEmpty && num.tryParse(input) > 60) {
                              return 'Max:60';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['gy'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Genel Kültür',
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 60) {
                              return 'Max:60';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['gk'][0] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 60) {
                              return 'Max:60';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['gk'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Eğitim Bilimleri',
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 80) {
                              return 'Max:80';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['eg'][0] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 80) {
                              return 'Max:80';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['eg'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'ÖABT Alan Testi',
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 75) {
                              return 'Max:75';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['al'][0] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 75) {
                              return 'Max:75';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['al'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      'HESAPLA',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _handleSubmit();
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      'TEMİZLE',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.reset();
                    },
                  ),
                ),
                SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
