import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './aday_a.dart';
import './hesap_a.dart';

class FormPageA extends StatefulWidget {
  @override
  _FormPageAState createState() => _FormPageAState();
}

class _FormPageAState extends State<FormPageA> {
  GlobalKey<FormState> _formKey = new GlobalKey();

  AdayA aday = AdayA({
    'gy': [0, 0],
    'gk': [0, 0],
    'eg': [0, 0],
    'hu': [0, 0],
    'ik': [0, 0],
    'is': [0, 0],
    'ma': [0, 0],
    'mu': [0, 0],
    'ca': [0, 0],
    'it': [0, 0],
    'ka': [0, 0],
    'ul': [0, 0],
  });

/*   _handleSubmit : validator koşullarını kontrol ediyor (60dan küçükmü) ve input değerlerini yanitlara veriyor, user datasını
   güncelliyor ve setState ile ekranı güncelliyor*/
  void _handleSubmit() {
    print('hesapla tıklandı');
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        aday = AdayA(aday.yanitlar);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HesapA(aday)));
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text('60 soru vardı'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('A GRUBU FORM'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Genel Yetenek',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Genel Kültür',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Hukuk',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['hu'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['hu'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'İktisat',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ik'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ik'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'İşletme',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['is'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['is'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Maliye',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ma'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ma'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Muhasebe',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['mu'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['mu'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Çalışma Ekonomisi',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ca'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ca'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'İstatistik',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['it'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['it'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Kamu Yönetimi',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ka'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ka'][1] =
                                (input.isEmpty) ? 0 : num.tryParse(input);
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Uluslar Arası',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Doğru',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ul'][0] =
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
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.0, horizontal: 8.0),
                              labelText: 'Yanlış',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          keyboardType: TextInputType.number,
                          validator: (input) {
                            if (input.isEmpty) {
                              return null;
                            } else if (num.tryParse(input) > 40) {
                              return 'Max:40';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String input) {
                            aday.yanitlar['ul'][1] =
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
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _handleSubmit();
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      'TEMİZLE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
