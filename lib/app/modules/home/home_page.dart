import 'package:cuidados_app/app/modules/home/drawer/drawer_home.dart';
import 'package:flutter/material.dart';

import '../../models/login/tipo_login.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tipoLoginProvider = Provider.of<TipoLogin>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 45,
              height: 45,
              color: Colors.white,
              // Você pode ajustar a largura e altura da imagem conforme necessário
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
      ),
      drawer: DrawerHome(),
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(16),
        childAspectRatio: 1.2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 0,
        children: [
          Column(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Ação do primeiro botão
                    if (tipoLoginProvider.tipoLogin == 'cuidador') {
                      Navigator.of(context).pushNamed('/rede_cuidador');
                    } else if (tipoLoginProvider.tipoLogin == 'paciente') {
                      Navigator.of(context).pushNamed('/rede_paciente');
                    }
                  },
                  child: Image.asset(
                    'assets/images/rede.png',
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text('Minha rede', style: TextStyle(
                fontFamily: 'Merriweather',
              ),),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Ação do segundo botão

                    if (tipoLoginProvider.tipoLogin == 'cuidador') {
                      Navigator.of(context)
                          .pushNamed('/dispenser_cuidador_list');
                    } else if (tipoLoginProvider.tipoLogin == 'paciente') {
                      Navigator.of(context).pushNamed('/tela_wifi');
                    }
                  },
                  child: Image.asset(
                    'assets/images/dispenser.png',
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text('Dispenser', style: TextStyle(
                fontFamily: 'Merriweather',
              ),),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (tipoLoginProvider.tipoLogin == 'paciente') {
                      Navigator.of(context)
                          .pushNamed('/grade_cadastro_medicamento_paciente');
                    } else if (tipoLoginProvider.tipoLogin == 'cuidador') {
                      Navigator.of(context)
                          .pushNamed('/lista_pacientes_cadastro_medicamento');
                    }

                    // Ação do segundo botão
                  },
                  child: Image.asset(
                    'assets/images/medicamento.png',
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text('Medicamento' ,style: TextStyle(
    fontFamily: 'Merriweather',
    ),),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Ação do segundo botão
                    Navigator.of(context).pushNamed('/consulta_home');
                  },
                  child: Image.asset(
                    'assets/images/consulta.png',
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text(
                'Consultas',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Ação do segundo botão
                    Navigator.of(context).pushNamed('/exame_home');
                  },
                  child: Image.asset(
                    'assets/images/img_exames_100.png',
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text(
                'Exames',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
