import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Homewidget extends StatefulWidget {
  Homewidget();

  @override
  _HomewidgetState createState() => _HomewidgetState();
}

class _HomewidgetState extends State<Homewidget> {
  TextEditingController txtcidade = TextEditingController();
  String resultado1 = '';
  String resultado2 = '';
  String resultado3 = '';
  String resultado4 = '';
  String resultado5 = '';

  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String temperatura = 'Temperatura ';
  String data = 'Data';
  String hora = 'Hora  ';
  String city = 'Cidade';
  String clique = 'Clique no icone abaixo';
  String descricao = 'Clima';

  clicouBotao() async {
    /*if (!cForm.currentState.validate()) return;*/
    String consulta = txtcidade.text;

    String url =
        "https://api.hgbrasil.com/weather?key=dbef1747&city_name=$consulta/";
    http.Response resposta;
    resposta = await http.get(url);

    Map<String, dynamic> tempo = json.decode(resposta.body);
    String city = tempo['results']['city'];
    String data = tempo['results']['date'];
    String hora = tempo['results']['time'];
    String temperatura = tempo['results']['temp'].toString() + '°';
    String descricao = tempo['results']['description'];
    setState(() {
      resultado1 = '$city';
      resultado2 = '$data';
      resultado3 = '$hora';
      resultado4 = '$temperatura';
      resultado5 = '$descricao';
    });
  }

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
        child: Form(
          key: cForm,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  padding: EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/imgs/logo4.png',
                    fit: BoxFit.contain,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Informe Cidade'),
                  controller: txtcidade,
                  keyboardType: TextInputType.text,
                ),
                Text(
                  '$resultado1',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  '$resultado2',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  '$resultado3',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  '$resultado4',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  '$resultado5',
                  style: TextStyle(fontSize: 40),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: RaisedButton(
                    onPressed: clicouBotao,
                    child: Text('Previsão'),
                    color: Colors.yellow[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
