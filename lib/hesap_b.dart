import 'package:flutter/material.dart';

import './aday_b.dart';
import './puanturleri.dart';

// B grubu sonuç tablosu ekranı

class HesapB extends StatelessWidget {
  final AdayB user;
  HesapB(this.user);
  @override
  Widget build(BuildContext context) {
    user.hamPuanHesapla();
    user.stdPuanHesapla();
    user.createASPSonuc(kpss17, kpss18, kpss19);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Puanlarınız:'),
          backgroundColor: Color(0xffac0a11),
        ),
        body: Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 10.0, 10.0),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('2019')),
                  DataColumn(label: Text('2018')),
                  DataColumn(label: Text('2017')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('P1')),
                    DataCell(Text('${user.sonuc19[0]}')),
                    DataCell(Text('${user.sonuc18[0]}')),
                    DataCell(Text('${user.sonuc17[0]}'))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('P2')),
                    DataCell(Text('${user.sonuc19[1]}')),
                    DataCell(Text('${user.sonuc18[1]}')),
                    DataCell(Text('${user.sonuc17[1]}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('P3')),
                    DataCell(Text('${user.sonuc19[2]}')),
                    DataCell(Text('${user.sonuc18[2]}')),
                    DataCell(Text('${user.sonuc17[2]}')),
                  ])
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
