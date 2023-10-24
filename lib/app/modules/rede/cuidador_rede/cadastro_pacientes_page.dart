import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../models/pacientes/cadastro_pacientes.dart';
import '../../../models/pacientes/pacientes_model.dart';

class CadastroPacientesPage extends StatelessWidget {
  const CadastroPacientesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cadastroPacientesProvider =
    Provider.of<CadastroPacientes>(context, listen: false);

    final nomeController = TextEditingController();
    final idadeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Cadastro de Pacientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),

            ),
            SizedBox(height: 10,),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                //labelText: 'Idade',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Idade:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(
                //labelText: 'Idade',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  padding: MaterialStateProperty.resolveWith<
                      EdgeInsetsGeometry?>((Set<MaterialState> states) {
                    return EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 145); // Padding padrão do botão
                  }),

                ),

                onPressed: () {
                  final nome = nomeController.text;
                  final idade = int.parse(idadeController.text);

                  final paciente = Paciente(nome: nome, idade: idade);
                  cadastroPacientesProvider.adicionarPaciente(paciente);

                  nomeController.clear();
                  idadeController.clear();
                },
                child: Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
