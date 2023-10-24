import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cuidadores/cadastro_cuidadores.dart';
import '../../home/drawer/drawer_home.dart';

class PacienteRedePage extends StatelessWidget {
  const PacienteRedePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cadastroCuidadoresProvider = Provider.of<CadastroCuidadores>(context, listen: false);

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
                  'MINHA REDE DE CUIDADORES',
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
      body: Consumer<CadastroCuidadores>(
        builder: (context, cadastroCuidadoresProvider, _) {
          return ListView.builder(
            itemCount: cadastroCuidadoresProvider.cuidadores.length,
            itemBuilder: (context, index) {
              final cuidador = cadastroCuidadoresProvider.cuidadores[index];
              return ListTile(
                title: Text(cuidador.nome),
                subtitle: Text(cuidador.especialidade),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastro_cuidadores');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
