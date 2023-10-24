import 'package:flutter/material.dart';

class TelaWifiPage extends StatelessWidget {
  const TelaWifiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Lista de Wi-Fi'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Wi-Fi 1'),
            onTap: () {
              Navigator.of(context).pushNamed('/caixa1_medicamento');
            },
          ),
          Divider(

          ),
          ListTile(
            title: Text('Wi-Fi 2'),
            onTap: () {},
          ),
          Divider(

          ),
          ListTile(
            title: Text('Wi-Fi 3'),
            onTap: () {},
          ),
          Divider(

          ),
        ],
      ),
    );
  }
}
