import 'package:flutter/material.dart';

import 'exame_model.dart';

class ExamesProvider extends ChangeNotifier {
  List<Exame> examesAgendados = [];
  List<Exame> examesRealizados = [];

  void adicionarExameAgendado(Exame exame) {
    examesAgendados.add(exame);
    notifyListeners();
  }

  void adicionarExameRealizado(Exame exame) {
    examesRealizados.add(exame);
    notifyListeners();
  }

  void removerExameAgendado(Exame exame) {
    examesAgendados.remove(exame);
    notifyListeners();
  }

  List<Exame> getExamesAgendados() {
    return examesAgendados;
  }

  List<Exame> getExamesRealizados() {
    return examesRealizados;
  }
}

