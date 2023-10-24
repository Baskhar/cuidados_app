import 'package:cuidados_app/app/models/pacientes/cadastro_pacientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/drawer/drawer_home.dart';

class CudadorRedePage extends StatelessWidget {
  const CudadorRedePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pacienteProvider = Provider.of<CadastroPacientes>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 45,
              height: 45,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'MediWay',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Ação do botão de voltar
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,

                  iconSize: 32,
                  padding: EdgeInsets.all(16),
                ),
                SizedBox(width: 40),
                Text(
                  'MINHA REDE DE PACIÊNTES',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerHome(),
         body: ListView.builder(
      itemCount: pacienteProvider.pacientes.length,
      itemBuilder: (context, index) {
        final paciente = pacienteProvider.pacientes[index];
        return ListTile(
          title: Text(paciente.nome),
          subtitle: Text(paciente.idade.toString()),
        );
      },
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.of(context).pushNamed('/cadastro_pacientes');
        },
        child: Icon(Icons.add),
      ),
    );

  }
}
