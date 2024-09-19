import 'package:atividade_mobile_4/components/list_card.dart';
import 'package:atividade_mobile_4/model/transacao_model.dart';
import 'package:atividade_mobile_4/view/transacao_form_view.dart';
import 'package:flutter/material.dart';

class TransacoesView extends StatefulWidget {
  TransacoesView({super.key});

  final List<TransacaoModel> _transacoes = [];

  @override
  State<TransacoesView> createState() => _TransacoesViewState();
}

class _TransacoesViewState extends State<TransacoesView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações Bancárias'),
      ),
      body: ListView.builder(
        itemCount: widget._transacoes.length,
        itemBuilder: (context, indice) {
          return ListCard(
              title: widget._transacoes[indice].descricao,
              subtitle: widget._transacoes[indice].valor.toString());
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TrasacaoForm();
            })).then((novaTransacao) => atualizaTransacoes(novaTransacao));
          }),
    );
  }

  void atualizaTransacoes(TransacaoModel novaTransacao) {
    if (novaTransacao != null) {
      setState(() {
        widget._transacoes.add(novaTransacao);
      });
    }
  }
}