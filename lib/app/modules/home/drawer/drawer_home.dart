import 'package:cuidados_app/app/models/login/nome_user.dart';
import 'package:flutter/material.dart';

import '../../../models/login/tipo_login.dart';
import 'package:provider/provider.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

// classe do menu lateral
class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    final nomeUserProvider = Provider.of<NomeUser>(context);
    var nomeUsuario = nomeUserProvider.getNomeUser;
    return Drawer(
      child: Column(
        children: [
          // adicionando um espaço no começo do drawer
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Color(0xFF4DE197),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            accountName: Text(
              '${nomeUsuario}',
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              '${nomeUsuario}@Gmail.com',
              style: TextStyle(color: Colors.black),
            ),
            // avatar
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_3_sharp,
                color: Colors.black,
                size: 50,
              ),
            ),
          ),
          // botão para alterar o nome de usuário
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Alterar Nome de Usuário'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String novoNome = nomeUsuario; // Valor inicial do campo de texto

                  return AlertDialog(
                    title: Text('Alterar Nome de Usuário'),
                    content: TextField(
                      onChanged: (value) {
                        novoNome = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Novo Nome de Usuário',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Alterar o nome de usuário
                          nomeUserProvider.setNomeUser = novoNome;
                          Navigator.of(context).pop();
                        },
                        child: Text('Confirmar',style: TextStyle(
                          color: Colors.green,
                        ),),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar',style: TextStyle(
                          color: Colors.red,
                        ),),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          // botão para sair
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              // Ação ao clicar no item do Drawer
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
