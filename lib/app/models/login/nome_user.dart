import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class NomeUser with ChangeNotifier {
  String _nomeUser = '';

  String get getNomeUser => _nomeUser;

  set setNomeUser(String value) {
    _nomeUser = value;
    notifyListeners();
  }
}
