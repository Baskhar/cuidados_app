import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/consultas/consulta_model.dart';
import '../../models/consultas/lista_consultas_provider.dart';

class AgendadasPage extends StatefulWidget {
  @override
  _AgendadasPageState createState() => _AgendadasPageState();
}

class _AgendadasPageState extends State<AgendadasPage> {
  @override
  Widget build(BuildContext context) {
    ConsultasProvider listaConsultasProvider =
    Provider.of<ConsultasProvider>(context, listen: true);
    List<Consulta> consultasAgendadas =
    listaConsultasProvider.getConsultasAgendadas();

    return Scaffold(
      body: ListView.builder(
        itemCount: consultasAgendadas.length,
        itemBuilder: (context, index) {
          Consulta consulta = consultasAgendadas[index];
          return ListTile(
            title: Text(consulta.especialidade),
            subtitle: Text(consulta.profissional),
            trailing: IconButton(
              icon: Icon(Icons.check_circle),
              color: Colors.green,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmar consulta realizada'),
                      content: Text('Deseja marcar esta consulta como realizada?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Marcar a consulta como realizada
                            listaConsultasProvider.marcarConsultaRealizada(consulta);
                            Navigator.of(context).pop();
                          },
                          child: Text('Confirmar',style: TextStyle(
                            color: Colors.green
                          ),),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancelar',style: TextStyle(
                            color: Colors.red
                          ),),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
