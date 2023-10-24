import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exames/exame_model.dart';
import '../../models/exames/lista_exames_provider.dart';

class RealizadasExamesPage extends StatefulWidget {
  @override
  _RealizadasExamesPageState createState() => _RealizadasExamesPageState();
}

class _RealizadasExamesPageState extends State<RealizadasExamesPage> {
  @override
  Widget build(BuildContext context) {
    ExamesProvider listaExamesProvider =
    Provider.of<ExamesProvider>(context, listen: true);
    List<Exame> examesRealizados = listaExamesProvider.getExamesRealizados();

    return Scaffold(
      body: ListView.builder(
        itemCount: examesRealizados.length,
        itemBuilder: (context, index) {
          Exame exame = examesRealizados[index];
          return ListTile(
            title: Text(exame.tipo),
            subtitle: Text(exame.observacoes), // Corrigido para exame.observacoes
            trailing: Text('${exame.data} ${exame.hora}'),
          );
        },
      ),
    );
  }
}
