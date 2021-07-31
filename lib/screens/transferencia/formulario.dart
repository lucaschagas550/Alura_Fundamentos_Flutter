import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criando Transfrência";

const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";

const _rotuloCampoNumeroConta = "Número da conta";
const _dicaCampoNumeroConta = "0000";

const _textBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciasState();
  }
}

class FormularioTransferenciasState extends State<FormularioTransferencia> {
  //recuperar o valor digitado no campo que esta refenrete ao _controladorCampoNumeroConta
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text(_textBotaoConfirmar),
              onPressed: () {
                _criarTransferencia(context);
              },
            ),
          ]),
        ));
  }

  void _criarTransferencia(BuildContext context) {
    //recebe o contexto por parametro

    debugPrint("clicou no confirmar");
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      // debugPrint("$transferenciaCriada");
      // debugPrint("criando transferencia");
      Navigator.pop(context, transferenciaCriada); // utiliza o context recebido
    }
  }
}
