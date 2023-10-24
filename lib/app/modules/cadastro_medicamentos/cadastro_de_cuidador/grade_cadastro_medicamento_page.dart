import 'package:flutter/material.dart';

class GradeCadastroMedicamentoPage extends StatefulWidget {
  const GradeCadastroMedicamentoPage({Key? key}) : super(key: key);

  @override
  State<GradeCadastroMedicamentoPage> createState() =>
      _GradeCadastroMedicamentoPageState();
}

class _GradeCadastroMedicamentoPageState
    extends State<GradeCadastroMedicamentoPage> {
  List<bool> _selectedCells = List.generate(21, (index) => false);

  @override
  Widget build(BuildContext context) {
    final nomePaciente = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Grade do $nomePaciente'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: 7 * 3,
            itemBuilder: (context, index) {
              final row = index ~/ 7;
              final column = index % 7;
              final isSelected = _selectedCells[index];

              return GestureDetector(
                onTap: () {
                  final selectedField = '$row-$column';
                  print(selectedField);

                  Navigator.of(context)
                      .pushNamed('/cadastro_medicamento')
                      .then((result) {
                    if (result != null && result is bool && result) {
                      setState(() {
                        _selectedCells[index] = true;
                      });
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Stack(
                    children: [
                      if (isSelected)
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
