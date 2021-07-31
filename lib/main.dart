import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

//run app significa que tudo que apresenta na tela pro usuario tem que estar dentro dele
//widte representa um elemento visual, eh representação generica de um componente
// pode considerar como home do materialapp um scaffold
// Com BytebankApp extraido é possivel utilizar uma das grandes vantagens do flutter o hot reload
void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
      home: ListaTransferencias(
          //Scaffold eh a barra do titulo
          ),
    );
  }
}
