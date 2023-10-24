import 'package:flutter/cupertino.dart';

class TipoLogin extends ChangeNotifier{
  String _tipoLogin = '';

  String get tipoLogin => _tipoLogin;

  set tipoLogin(String value) {
    _tipoLogin = value;

  }
}