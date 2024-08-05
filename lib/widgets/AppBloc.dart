import 'package:flutter/material.dart';

class Appbloc extends ChangeNotifier {
  bool _isconnected = false;
  bool _isLoading = false;
  bool _isUploading = false;

  get isconnected => _isconnected;
  get isLoading => _isLoading;
  get isUploading => _isUploading;

  void changeConnection(bool connection) {
    print("changed to $connection");
    _isconnected = connection;
    notifyListeners();
  }

  void changeIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void changeIsUploading(bool uplaoding) {
    _isUploading = uplaoding;
    notifyListeners();
  }
}
