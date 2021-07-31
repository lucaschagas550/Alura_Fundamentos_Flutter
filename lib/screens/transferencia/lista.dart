import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Transferência";

//Stateful: pode modificar o conteudo do widget de maneira dinamica
//Stateles: não se pode modificar o conteudo de maneira dinamica
//Classe com widget para apresentar uma lista
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  //se for algo que nao modifica o valor se usa widget. para acessar por fora e deixamos no StatefulWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //Ao pressionar o botão navegar para outra tela
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            })).then((transferenciaRecebida) {
              // then faz a operação assincrona
              // debugPrint("chegou no then do future");
              // debugPrint("$transferenciaRecebida");
              if (transferenciaRecebida != null) {
                setState(() {
                  _atualiza(transferenciaRecebida);
                });
              }
            });
          }),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    widget._transferencias.add(transferenciaRecebida);
  }
}

//stateful permiter elementos atualizar dinamicamente

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}
