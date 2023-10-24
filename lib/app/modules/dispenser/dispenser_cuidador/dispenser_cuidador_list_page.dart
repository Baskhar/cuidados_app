import 'package:flutter/material.dart';

import '../../../models/pacientes/cadastro_pacientes.dart';
import 'package:provider/provider.dart';

class DispenserCuidadorListPage extends StatelessWidget {
  const DispenserCuidadorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pacienteProvider = Provider.of<CadastroPacientes>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de pacientes'),
      ),
      body: ListView.builder(
        itemCount: pacienteProvider.pacientes.length,
        itemBuilder: (context, index) {
          final paciente = pacienteProvider.pacientes[index];
          return ListTile(
            title: Text(paciente.nome),
            subtitle: Text(paciente.idade.toString()),
            onTap: () {
              final nomePaciente = paciente.nome;
              Navigator.of(context)
                  .pushNamed('/caixa1_medicamento', arguments: nomePaciente);
            },
          );
        },
      ),
    );
  }
}
