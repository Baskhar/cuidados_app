import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/caixa_medicamentos/lista_medicamentos_model.dart';
import '../../../models/caixa_medicamentos/medicamentos_model.dart';

class DetalhesMedicamentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listaMedicamentos = Provider.of<ListaMedicamentosModel>(context).listaMedicamentos;
    final MedicamentoModel medicamento = listaMedicamentos[0]; // Exemplo: acessando o primeiro medicamento da lista

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text('Detalhes do Medicamento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.medical_services,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 8),
                Text(
                  'Medicamento: ${medicamento.nome}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Dias de Uso:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              medicamento.diasDeUso.join(', '),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Horários:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              medicamento.horarios.join(', '),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              medicamento.descricao,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
