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
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Consumer<Transferencias>(builder: ((context, value, child) {
            final _quantidade = value.transferencias.length > 3
                ? 3
                : value.transferencias.length;
            final _ultimasTransferencias =
                value.transferencias.reversed.toList();
            if (_quantidade > 0)
              return Expanded(
                child: ListView.builder(
                    itemCount: _quantidade,
                    itemBuilder: (context, index) {
                      return ItemTransferencia(_ultimasTransferencias[index]);
                    }),
              );
            return Container(
              alignment: Alignment.center,
              child: Text(
                "Você não possui transferências",
                style: TextStyle(fontSize: 18),
              ),
            );
          })),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListaTransferencias();
              }));
            },
            child: Container(
              child: Center(child: Text('Ver todas transferências')),
              width: MediaQuery.of(context).size.width * 0.8,
            )),
      ],
    );
  }
}
