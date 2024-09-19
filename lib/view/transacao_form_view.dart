import 'package:atividade_mobile_4/model/transacao_model.dart';
import 'package:flutter/material.dart';

class TrasacaoForm extends StatefulWidget {
  final TextEditingController _ctrlValor = TextEditingController();
  final TextEditingController _ctrlDescricao = TextEditingController();

  TrasacaoForm({super.key});

  @override
  State<TrasacaoForm> createState() => _TrasacaoFormState();
}

class _TrasacaoFormState extends State<TrasacaoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Transações Bancárias'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget._ctrlValor,
                decoration: const InputDecoration(
                  labelText: 'Valor da Transação',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget._ctrlDescricao,
                decoration: const InputDecoration(
                  labelText: 'Descricao da Transação',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _criarTransacoes(context);
                },
                child: Text('Confirmar'))
          ],
        ),
      ),
    );
  }

  void _criarTransacoes(BuildContext context) {
    final double? valorTransacao = double.tryParse(widget._ctrlValor.text);
    final String descricaoTransacao = widget._ctrlDescricao.value.text.toString();

    if (valorTransacao != null) {
      final transacao = TransacaoModel(descricaoTransacao, valorTransacao);
      print(transacao.descricao);
      Navigator.pop(context, transacao);
    }
  }
}
