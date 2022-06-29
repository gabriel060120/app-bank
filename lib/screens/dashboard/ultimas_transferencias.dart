import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../transferencia/lista.dart';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 15,
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
        ),
        Text(
          "Ultimas Transferências",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<Transferencias>(builder: ((context, value, child) {
          final _quantidade = value.transferencias.length;
          final _ultimasTransferencias = value.transferencias.reversed.toList();

          // return ListView.builder(
          //     itemCount: ,
          //     itemBuilder: ((context, index) {
          //       return ItemTransferencia_ultimasTransferencias[index]);
          //     }));
          return Container();
        })),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListaTransferencias();
              }));
            },
            child: Container(
              child: Center(child: Text('Transferencias')),
              width: MediaQuery.of(context).size.width * 0.8,
            )),
      ],
    );
  }
}
