import 'package:cuidados_app/app/models/caixa_medicamentos/celular_model.dart';

class MedicamentoModel {
  final String nome;
  final List<String> diasDeUso;
  final List<String>  horarios;
  final String descricao;
  //final Cell cell;

  MedicamentoModel({required this.nome, required this.diasDeUso, required this.horarios,required this.descricao,});
}