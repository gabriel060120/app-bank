import 'package:bytebank/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact_form.dart';
import '../../models/contact_model.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            findAll();
          });
        },
        child: FutureBuilder(
          future: findAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Contact> items = snapshot.data;
              return items.isNotEmpty
                  ? ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ItemContacts(items[index]);
                      })
                  : Center(
                      child: Text("Você ainda não possui contatos salvos"),
                    );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactForm(),
              ));
          //     .then((value) {
          //   findAll();
          // });
          findAll();
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
        '${_contact.name}',
        style: TextStyle(fontSize: 24),
      ),
      subtitle: Text(
        _contact.conta.toString(),
        style: TextStyle(fontSize: 16),
      ),
    ));
  }
}
