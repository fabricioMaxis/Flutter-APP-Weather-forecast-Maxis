import 'package:curso_api/HomeWidget.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Maxis'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/imgs/back3.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: RaisedButton(
            textColor: Colors.yellow,
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Homewidget();
              }));
            },
            child: Text(
              'Entrar',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
