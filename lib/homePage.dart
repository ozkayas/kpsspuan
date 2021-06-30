import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xff7f7f7f),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _raisedButton(context, 'KPSS A', '/FormPageA'),
            _raisedButton(context, 'KPSS B', '/FormPageB'),
            _raisedButton(context, 'ÖABT', '/FormPageOABT'),
          ],
        ),
        //color: Colors.grey[600],
      ),
    );
  }
}

Container _raisedButton(
    BuildContext context, String textOfButton, String routeText) {
  double _height = 90;
  double _borderRadius = _height / 3;
  return Container(
    padding: EdgeInsets.all(8.0),
    height: _height,
    width: 300,
    child: RaisedButton(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(_borderRadius)),
      onPressed: () {
        Navigator.pushNamed(context, routeText);
        /*  Navigator.push(
            context, MaterialPageRoute(builder: (context) => FormPageB()));*/
      },
      child: Text(
        textOfButton,
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ),
  );
}
