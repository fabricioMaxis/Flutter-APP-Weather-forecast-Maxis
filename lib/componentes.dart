import 'package:flutter/material.dart';

class Componentes {
  static rotulo(String rotulo) {
    return Text(
      rotulo,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  static caixaDeTexto(
      String rotulo, String dica, TextEditingController controlador, valicao,
      {bool obscure = false, bool numero = false}) {
    return TextFormField(
      controller: controlador,
      obscureText: obscure,
      validator: valicao,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 18),
        hintText: dica,
        hintStyle: TextStyle(fontSize: 10, color: Colors.red),
      ),
    );
  }

  static botao(String _texto, Function _f) {
    return Container(
      child: RaisedButton(
        onPressed: _f,
        child: Text(
          _texto,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 4)),
        color: Colors.black87.withOpacity(0.4),
        hoverColor: Colors.yellow.withOpacity(0.3),
      ),
    );
  }
}
