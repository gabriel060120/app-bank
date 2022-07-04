import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';
import 'contact_model.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Contact> _contatos = [Contact(conta: 112, name: "Marcos")];
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: ListView.builder(
        itemCount: _contatos.length,
        itemBuilder: (context, index) {
          return ItemContacts(_contatos[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactForm(),
              )).then((value) {
            _contatos.add(value);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemContacts extends StatelessWidget {
  final Contact _contact;

  const ItemContacts(this._contact);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(
        _contact.name,
        style: TextStyle(fontSize: 24),
      ),
      subtitle: Text(
        _contact.conta.toString(),
        style: TextStyle(fontSize: 16),
      ),
    ));
  }
}
