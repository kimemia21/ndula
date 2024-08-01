import 'package:flutter/material.dart';

class Appbloc extends ChangeNotifier {
  bool _isconnected=false;

  get isconnected => _isconnected;

  void changeConnection(bool connection) {
    print("changed to $connection");
    _isconnected = connection;
    notifyListeners();
  }
}
