import 'package:flutter/material.dart';
import 'consulta_model.dart';

class ConsultasProvider extends ChangeNotifier {
  List<Consulta> consultasAgendadas = [];
  List<Consulta> consultasRealizadas = [];

  void adicionarConsultaAgendada(Consulta consulta) {
    consultasAgendadas.add(consulta);
    notifyListeners();
  }

  void marcarConsultaRealizada(Consulta consulta) {
    consultasAgendadas.remove(consulta);
    consultasRealizadas.add(consulta);
    notifyListeners();
  }

  List<Consulta> getConsultasAgendadas() {
    return consultasAgendadas;
  }

  List<Consulta> getConsultasRealizadas() {
    return consultasRealizadas;
  }
}
