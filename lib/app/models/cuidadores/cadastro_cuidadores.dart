import 'package:flutter/material.dart';

import 'cuidadores_model.dart';

class CadastroCuidadores extends ChangeNotifier {
  List<CuidadorModel> _cuidadores = [];

  List<CuidadorModel> get cuidadores => _cuidadores;

  void adicionarCuidador(CuidadorModel cuidador) {
    _cuidadores.add(cuidador);
    notifyListeners();
  }
}