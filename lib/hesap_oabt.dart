import 'package:flutter/material.dart';
import './aday_oabt.dart';

class HesapOABT extends StatelessWidget {
  final AdayOABT user;
  HesapOABT(this.user);
  @override
  Widget build(BuildContext context) {
    user.hamPuanHesapla();
    user.stdPuanHesapla();
    user.createASPSonuc();
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
                  ],
                ),
                Expanded(
                    child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'P1',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                              '${user.sonuc19[0]}')), /*
                            Expanded(
                                flex: 2, child: Text('${user.sonuc18[index]}')),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc17[index]}')),*/
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'P2',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                              '${user.sonuc19[1]}')), /*
                            Expanded(
                                flex: 2, child: Text('${user.sonuc18[index]}')),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc17[index]}')),*/
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'P3',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                              '${user.sonuc19[2]}')), /*
                            Expanded(
                                flex: 2, child: Text('${user.sonuc18[index]}')),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc17[index]}')),*/
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'P10',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                              '${user.sonuc19[3]}')), /*
                            Expanded(
                                flex: 2, child: Text('${user.sonuc18[index]}')),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc17[index]}')),*/
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'P121',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                              '${user.sonuc19[4]}')), /*
                            Expanded(
                                flex: 2, child: Text('${user.sonuc18[index]}')),
                            Expanded(
                                flex: 2, child: Text('${user.sonuc17[index]}')),*/
                    ],
                  ),
                  Divider(
                    height: 18,
                  )
                ])),
              ],
            ),
          )),
    );
  }
}
