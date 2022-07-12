import 'package:bytebank/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  test('O banco de dados deve iniciar', () async {
    db = await createDatabase();
    expect(db, isA<Database>());
  });
}
