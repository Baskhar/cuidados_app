import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cuidadores/cadastro_cuidadores.dart';
import '../../../models/cuidadores/cuidadores_model.dart';

class CadastroCuidadoresPage extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController especialidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cadastroCuidadoresProvider = Provider.of<CadastroCuidadores>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Cadastro de Cuidadores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              'Especialidade:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: especialidadeController,
              decoration: InputDecoration(
                //labelText: 'Idade',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
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
                  final especialidade = especialidadeController.text;

                  final cuidador = CuidadorModel(nome: nome, especialidade: especialidade);
                  cadastroCuidadoresProvider.adicionarCuidador(cuidador);

                  nomeController.clear();
                  especialidadeController.clear();
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
