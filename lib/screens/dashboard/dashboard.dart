import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/dashboard/ultimas_transferencias.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../transferencia/lista.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bytebank'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  'assets/images/bytebank_logo.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SaldoCard(),
            ),
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FormularioDeposito();
                          }));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text('Deposito'))),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FormularioTransferencia();
                        }));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Text('Transferencia'))),
                ],
              ),
            ),
            UltimasTransferencias(),
          ],
        ));
  }
}
