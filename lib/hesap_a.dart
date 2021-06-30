import 'package:flutter/material.dart';

import './aday_a.dart';
import './puanturleri.dart';

// B grubu sonuç tablosu ekranı

class HesapA extends StatelessWidget {
  final AdayA user;
  HesapA(this.user);
  @override
  Widget build(BuildContext context) {
    user.hamPuanHesapla();
    user.stdPuanHesapla();
    user.createASPSonuc(kpss17, kpss18, kpss19);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Puanlarınız'),
            backgroundColor: Color(0xffac0a11),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(''),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '2019',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('2018',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('2017',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 48,
                    itemBuilder: (context, index) {
                      return Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'P${index + 1}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc19[index]}')),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc18[index]}')),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc17[index]}')),
                          ],
                        ),
                        Divider(
                          height: 18,
                        )
                      ]);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
