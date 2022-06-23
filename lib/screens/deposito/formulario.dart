import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/editor.dart';
import '../../models/saldo.dart';

const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Confirmar';

TextEditingController _controladorCampoValor = TextEditingController();

class FormularioDeposito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receber Deposito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaDeposito(context) {
    double valor = double.tryParse(_controladorCampoValor.text);
    if (validaDeposito(valor)) {
      Provider.of<Saldo>(context, listen: false).adiciona(valor);
      Navigator.of(context).pop();
    }
  }

  bool validaDeposito(valor) {
    return valor != null && valor > 0;
  }
}
