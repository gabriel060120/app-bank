import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_model.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Contact> _contatos = [];
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
      leading: Icon(Icons.monetization_on),
      title: Text(_contact.name),
      subtitle: Text(_contact.conta.toString()),
    ));
  }
}
