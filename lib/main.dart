import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './homePage.dart';
import './form_a.dart';
import './form_b.dart';
import './form_oabt.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KPSS Puan ver 1.0',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        //primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Color(0xffac0a11),
        ),
        buttonColor: Color(0xffac0a11),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/FormPageA': (context) => FormPageA(),
        '/FormPageB': (context) => FormPageB(),
        '/FormPageOABT': (context) => FormPageOABT(),
      },
      //home: HomePage(),
    );
  }
}

/**
 *
 * Bu Widget daha sonra denenecek, buradan okunan doğru yanlış sayılarını yukarı aktaramadım !!
 * Bu yüzden şimdilik bu şekilde uzun uzun kaldı ana Widget.
 *
 */
/*

class RowOfTests extends StatelessWidget {
  final String testName;
  final String testLabel;
  final yanitlar = {
    'gy': [0, 0],
    'gk': [0, 0]
  };

  RowOfTests(this.testName, this.testLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: <Widget>[
          Expanded(
              flex: 2,
              child: Text(
                'GENEL KÜLTÜR',
                style: TextStyle(fontSize: 18),
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
    );
  }
}
*/
