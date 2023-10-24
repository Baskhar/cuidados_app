import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/consultas/consulta_model.dart';
import '../../models/consultas/lista_consultas_provider.dart';

class RealizadasPage extends StatefulWidget {
  @override
  _RealizadasPageState createState() => _RealizadasPageState();
}

class _RealizadasPageState extends State<RealizadasPage> {
  @override
  Widget build(BuildContext context) {
    ConsultasProvider listaConsultasProvider =
    Provider.of<ConsultasProvider>(context, listen: true);
    List<Consulta> consultasRealizadas =
    listaConsultasProvider.getConsultasRealizadas();

    return Scaffold(
      body: ListView.builder(
        itemCount: consultasRealizadas.length,
        itemBuilder: (context, index) {
          Consulta consulta = consultasRealizadas[index];
          return ListTile(
            title: Text(consulta.especialidade),
            subtitle: Text(consulta.profissional),
            trailing: Text('${consulta.data} ${consulta.hora}'),
          );
        },
      ),
    );
  }
}
