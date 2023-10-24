import 'package:flutter/material.dart';

import 'pacientes_model.dart';

class CadastroPacientes extends ChangeNotifier {
  List<Paciente> _pacientes = [];

  List<Paciente> get pacientes => _pacientes;

  void adicionarPaciente(Paciente paciente) {
    _pacientes.add(paciente);
    notifyListeners();
  }
}
