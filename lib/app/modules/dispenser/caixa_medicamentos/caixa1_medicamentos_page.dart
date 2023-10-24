import 'package:flutter/material.dart';

import '../../../models/caixa_medicamentos/caixa_medicamento_model.dart';
import '../../../models/caixa_medicamentos/lista_medicamentos_model.dart';

class Caixa1MedicamentoPage extends StatelessWidget {
  const Caixa1MedicamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final caixaMedicamento = CaixaMedicamento();
    final listaMedicamentos = ListaMedicamentosModel();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Grade de Medicamentos'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                SizedBox(width: 4),
                Text(
                  'Possui Medicamento',
                  // style: TextStyle(fontFamily: 'Merriweather'),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                SizedBox(width: 4),
                Text(
                  'Não Possui Medicamento',
                  //  style: TextStyle(fontFamily: 'Merriweather'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.0, // Adjust this value as needed
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: caixaMedicamento.medicamentos.length * 7,
                itemBuilder: (context, index) {
                  final row = index ~/ 7;
                  final column = index % 7;
                  final hasMedication = caixaMedicamento.medicamentos[row][column];

                  return GestureDetector(
                    onTap: () {
                      final selectedField = '$row-$column';
                      print(selectedField);
                      final selectedMedication = listaMedicamentos.listaMedicamentos[index];
                      print(selectedMedication);
                      Navigator.of(context).pushNamed(
                        '/detalhes_medicamento',
                        arguments: selectedMedication,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Icon(
                          hasMedication ? Icons.check_circle : Icons.cancel,
                          color: hasMedication ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}
