import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './aday_b.dart';
import './hesap_b.dart';

class FormPageB extends StatefulWidget {
  @override
  _FormPageBState createState() => _FormPageBState();
}

class _FormPageBState extends State<FormPageB> {
  GlobalKey<FormState> _formKey = new GlobalKey();

  AdayB aday = AdayB({
    'gy': [0, 0],
    'gk': [0, 0]
  });

/*   _handleSubmit : validator koşullarını kontrol ediyor (60dan küçükmü) ve input değerlerini yanitlara veriyor, user datasını
   güncelliyor ve setState ile ekranı güncelliyor*/

  void _handleSubmit() {
    print('hesapla tıklandı');
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        aday = AdayB(aday.yanitlar);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HesapB(aday)));
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text('Sınavda Kaç Soru vardı :)'),
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
          title: Text('B GRUBU FORM'),
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
                  padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.all(8.0),
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
