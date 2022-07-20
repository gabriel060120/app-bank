import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../database/app_database.dart';
import '../../models/contact_model.dart';

class ContactForm extends StatefulWidget {
  ContactForm({Key key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController nameController = TextEditingController();

  TextEditingController contaController = TextEditingController();

  FocusNode contaFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar contato"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(),
              ),
              autofocus: true,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(contaFocus);
              },
              controller: nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Conta",
                border: OutlineInputBorder(),
              ),
              controller: contaController,
              focusNode: contaFocus,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      nameController.text != null &&
                      contaController.text.trim().isNotEmpty &&
                      contaController.text != null) {
                    final String newName = nameController.text;
                    final int newConta = int.tryParse(contaController.text);
                    final Contact newContact =
                        Contact(name: newName, conta: newConta);
                    save(newContact);
                    Navigator.pop(context);
                  }
                },
                child: Text("Salvar")),
          )
        ],
      ),
    );
  }
}
