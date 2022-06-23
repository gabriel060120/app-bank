import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adiciona(double newValue) {
    this.valor += newValue;
    notifyListeners();
  }

  void subtrai(double value) {
    this.valor -= value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}
