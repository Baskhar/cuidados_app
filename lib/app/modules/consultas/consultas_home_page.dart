import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'consultas_agendadas_page.dart';
import 'consultas_realizadas_page.dart';
import 'marcacao_consulta.dart';


class ConsultaHomePage extends StatefulWidget {
  const ConsultaHomePage({Key? key}) : super(key: key);

  @override
  State<ConsultaHomePage> createState() => _ConsultaHomePageState();
}

class _ConsultaHomePageState extends State<ConsultaHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AgendadasPage(),
    RealizadasPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agendadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Realizadas',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MarcacaoConsultaPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}