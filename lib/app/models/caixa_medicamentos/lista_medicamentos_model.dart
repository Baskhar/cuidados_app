import 'package:flutter/foundation.dart';

import 'medicamentos_model.dart';

class ListaMedicamentosModel extends ChangeNotifier{
  List<MedicamentoModel> listaMedicamentos = [
MedicamentoModel(
      nome: 'Dipirona',
      diasDeUso: ['Segunda', 'Quarta', 'Sexta'],
      horarios: ['8:00', '12:00', '18:00'],
  descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Tetraciclina',
      diasDeUso: ['Terça', 'Quinta', 'Sábado'],
      horarios: ['9:00', '14:00', '20:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Paracetamol',
      diasDeUso: ['Todos os dias'],
      horarios: ['9:00', '15:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Omeprazol',
      diasDeUso: ['Segunda', 'Quarta', 'Sexta'],
      horarios: ['8:30', '13:30', '19:30'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Ibuprofeno',
      diasDeUso: ['Todos os dias'],
      horarios: ['10:00', '16:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Aspirina',
      diasDeUso: ['Segunda', 'Quarta', 'Sexta'],
      horarios: ['9:30', '14:30', '19:30'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Amoxicilina',
      diasDeUso: ['Terça', 'Quinta', 'Sábado'],
      horarios: ['8:30', '13:30', '18:30'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Azitromicina',
      diasDeUso: ['Todos os dias'],
      horarios: ['11:00', '17:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Loratadina',
      diasDeUso: ['Segunda', 'Quarta', 'Sexta'],
      horarios: ['10:30', '15:30', '20:30'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Dexametasona',
      diasDeUso: ['Terça', 'Quinta', 'Sábado'],
      horarios: ['9:30', '14:30', '19:30'],
      descricao: 'descrição 1',
    ),

    MedicamentoModel(
      nome: 'Cetirizina',
      diasDeUso: ['Segunda','Quinta'],
      horarios: ['20:00', '21:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Ranitidina',
      diasDeUso: ['Terça','Sexta'],
      horarios: ['14:00', '18:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Metformina',
      diasDeUso: ['Sábado','Domingo'],
      horarios: ['10:00', '16:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Sinvastatina',
      diasDeUso: ['Domingo', 'Terça'],
      horarios: ['19:00', '22:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Losartana',
      diasDeUso: ['Domingo'],
      horarios: ['13:00', '16:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Captopril',
      diasDeUso: ['Sábado'],
      horarios: ['6:00', '8:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Cloridrato de Sertralina',
      diasDeUso: ['Todos os dias'],
      horarios: ['10:00', '16:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Hidroclorotiazida',
      diasDeUso: ['Sexta'],
      horarios: ['11:00', '12:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Cloridrato de Propranolol',
      diasDeUso: ['Quinta'],
      horarios: ['7:00', '8:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Cloridrato de Ciclobenzaprina',
      diasDeUso: ['Quarta'],
      horarios: ['10:00', '16:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Clonazepam',
      diasDeUso: ['Terça'],
      horarios: ['15:00', '16:00'],
      descricao: 'descrição 1',
    ),
    MedicamentoModel(
      nome: 'Nimesulida',
      diasDeUso: ['Segunda'],
      horarios: ['9:00', '10:00'],
      descricao: 'descrição 1',
    ),
  ];

  // List<MedicamentoModel> get listaMedicamentos => _listaMedicamentos;
  //
  // void adicionarMedicamento(MedicamentoModel medicamento) {
  //   _listaMedicamentos.add(medicamento);
  //   notifyListeners();
  // }
}