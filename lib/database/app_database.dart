import 'dart:io';

import 'package:bytebank/models/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

Future<Database> createDatabase() async {
  final databasePath = await getDatabasesPath();
  final String path = join(databasePath, "bytebank.db");

  db = await openDatabase(path, onCreate: (db, version) {
    db.execute('''
CREATE TABLE contacts (
  id INTEGER PRIMARY KEY,
  name TEXT,
  account_number INTEGER
)
''');
  }, version: 1);
  return db;
}

Future<int> save(Contact contact) {
  final Map<String, dynamic> contactMap = {
    'name': contact.name,
    'account_number': contact.conta
  };
  return db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  final List<Map<String, dynamic>> results = await db.query('contacts');
  results;
  List<Contact> contacts = [];

  if (results != null && results.isNotEmpty) {
    results.forEach((map) {
      contacts.add(Contact(
          id: map['id'], conta: map['account_number'], name: map['name']));
    });
  }
  return contacts;
}
