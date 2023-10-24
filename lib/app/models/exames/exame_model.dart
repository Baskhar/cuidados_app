class Exame {
  final String especialidade;
  final String tipo;
  final String data;
  final String hora;
  final String observacoes;
  bool realizado;

  Exame({
    required this.especialidade,
    required this.tipo,
    required this.data,
    required this.hora,
    required this.observacoes,
    this.realizado = false,
  });

  void marcarComoRealizado() {
    realizado = true;
  }
}
