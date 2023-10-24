import 'package:flutter/material.dart';

import '../../models/consultas/consulta_model.dart';
import '../../models/consultas/lista_consultas_provider.dart';
import 'package:provider/provider.dart';

class MarcacaoConsultaPage extends StatefulWidget {
  @override
  _MarcacaoConsultaPageState createState() => _MarcacaoConsultaPageState();
}

class _MarcacaoConsultaPageState extends State<MarcacaoConsultaPage> {
  String? especialidadeSelecionada;
  String? profissionalSelecionado;
  String? dataSelecionada;
  String? horaSelecionada;
  String? acompanhante;
  String? localizacao;
  String? anotacao;

  List<String> especialidades = ['Especialidade 1', 'Especialidade 2'];
  List<String> profissionais = ['Profissional 1', 'Profissional 2'];

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcação de Consulta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Especialidade:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: larguraTela - 2,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: especialidadeSelecionada,
                    isExpanded: true,
                    items: especialidades.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(child: Text(value)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        especialidadeSelecionada = newValue;
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
              ),

              SizedBox(height: 20),
              Text(
                'Profissional:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Container(
                width: larguraTela - 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: Container(), // Remove a barra inferior
                  value: profissionalSelecionado,
                  items: profissionais.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(child: Text(value)), // Centraliza o texto
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      profissionalSelecionado = newValue;
                    });
                  },
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
                  //  borderSide: BorderSide(color: Colors.red)
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
                  //    borderSide: BorderSide(color: Colors.red)
                  ),
                ),
                onChanged: (value) {
                  horaSelecionada = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Acompanhante:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                     // borderSide: BorderSide(color: Colors.red)
                  ),
                ),
                onChanged: (value) {
                  acompanhante = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Localização:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                     // borderSide: BorderSide(color: Colors.red)
                  ),
                ),
                onChanged: (value) {
                  localizacao = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Anotação:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                     // borderSide: BorderSide(color: Colors.red)
                  ),
                ),
                onChanged: (value) {
                  anotacao = value;
                },
              ),
              SizedBox(height: 30),
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
                    if (especialidadeSelecionada != null &&
                        profissionalSelecionado != null &&
                        dataSelecionada != null &&
                        horaSelecionada != null &&
                        acompanhante != null &&
                        localizacao != null &&
                        anotacao != null) {
                      Consulta consulta = Consulta(
                        especialidade: especialidadeSelecionada!,
                        profissional: profissionalSelecionado!,
                        data: dataSelecionada!,
                        hora: horaSelecionada!,
                        acompanhante: acompanhante!,
                        localizacao: localizacao!,
                        anotacao: anotacao!,
                      );

                      ConsultasProvider consultasProvider =
                          Provider.of<ConsultasProvider>(context, listen: false);
                      consultasProvider.adicionarConsultaAgendada(consulta);

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
                                child: Text('OK',style: TextStyle(
                                  color: Colors.black
                                ),),
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
