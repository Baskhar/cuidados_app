import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exames/exame_model.dart';
import '../../models/exames/lista_exames_provider.dart';

class ExamesPage extends StatefulWidget {
  @override
  _ExamesPageState createState() => _ExamesPageState();
}

class _ExamesPageState extends State<ExamesPage> {
  @override
  Widget build(BuildContext context) {
    ExamesProvider listaExamesProvider =
    Provider.of<ExamesProvider>(context, listen: true);
    List<Exame> examesAgendados = listaExamesProvider.getExamesAgendados();

    return Scaffold(
      body: ListView.builder(
        itemCount: examesAgendados.length,
        itemBuilder: (context, index) {
          Exame exame = examesAgendados[index];
          return ListTile(
            title: Text(exame.tipo),
            subtitle: Text(exame.especialidade),
            trailing: IconButton(
              icon: Icon(Icons.check_circle),
              color: Colors.green,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmar exame realizado'),
                      content: Text('Deseja marcar este exame como realizado?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Marcar o exame como realizado
                            exame.marcarComoRealizado();

                            // Remover o exame da lista de exames agendados
                            listaExamesProvider.removerExameAgendado(exame);

                            // Adicionar o exame à lista de exames realizados
                            listaExamesProvider.adicionarExameRealizado(exame);

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
