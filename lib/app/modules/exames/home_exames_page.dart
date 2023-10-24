import 'package:cuidados_app/app/modules/exames/relizados_exames_page.dart';
import 'package:flutter/material.dart';


import 'exames_agendados_page.dart';
import 'marcacao_exame.dart';

class HomeExamesPage extends StatefulWidget {
  const HomeExamesPage({Key? key}) : super(key: key);

  @override
  State<HomeExamesPage> createState() => _HomeExamesPageState();
}

class _HomeExamesPageState extends State<HomeExamesPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ExamesPage(),
    RealizadasExamesPage(),
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
        title: Text('Exames'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agendados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Realizados',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MarcacaoExamePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _selectedIndex,
      children: _pages,
    );
  }
}
