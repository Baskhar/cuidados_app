import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/exames/exame_model.dart';
import '../../models/exames/lista_exames_provider.dart';

class MarcacaoExamePage extends StatefulWidget {
  @override
  _MarcacaoExamePageState createState() => _MarcacaoExamePageState();
}

class _MarcacaoExamePageState extends State<MarcacaoExamePage> {
  String? tipoExameSelecionado;
  String? localSelecionado;
  String? dataSelecionada;
  String? horaSelecionada;
  String? observacao;

  List<String> tiposExames = ['Tipo de Exame 1', 'Tipo de Exame 2'];
  List<String> locais = ['Local 1', 'Local 2'];

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcação de Exame'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tipo de Exame:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: larguraTela - 2,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: tipoExameSelecionado,
                  items: tiposExames.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      tipoExameSelecionado = newValue;
                    });
                  },
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  elevation: 0,
                  underline: Container(), // Remove a barra inferior
                  isDense: true, // Centraliza os itens
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Local:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: larguraTela - 2,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: localSelecionado,
                  items: locais.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      localSelecionado = newValue;
                    });
                  },
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  elevation: 0,
                  underline: Container(), // Remove a barra inferior
                  isDense: true, // Centraliza os itens
                ),
              ),
              SizedBox(height: 20),


              Text(
                'Data:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      //borderSide: BorderSide(color: Colors.red)
                  ),
                ),
                onChanged: (value) {
                  dataSelecionada = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Hora:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    //borderSide: BorderSide(color: Colors.red)
                  ),
                ),
                onChanged: (value) {
                  horaSelecionada = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Observação:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    //borderSide: BorderSide(color: Colors.red)
                  ),
                ),
                onChanged: (value) {
                  observacao = value;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    padding:
                    MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                            (Set<MaterialState> states) {
                          return EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 145); // Padding padrão do botão
                        }),
                  ),
                  onPressed: () {
                    if (tipoExameSelecionado != null &&
                        localSelecionado != null &&
                        dataSelecionada != null &&
                        horaSelecionada != null &&
                        observacao != null) {
                      Exame exame = Exame(
                        tipo: tipoExameSelecionado!,
                        especialidade: localSelecionado!,
                        data: dataSelecionada!,
                        hora: horaSelecionada!,
                        observacoes: observacao!,
                      );

                      ExamesProvider examesProvider =
                          Provider.of<ExamesProvider>(context, listen: false);
                      examesProvider.adicionarExameAgendado(exame);

                      Navigator.pop(context);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erro'),
                            content: Text(
                                'Por favor, preencha todos os campos antes de salvar.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
