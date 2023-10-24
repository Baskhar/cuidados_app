import 'package:cuidados_app/app/modules/rede/paciente_rede/paciente_rede_page.dart';
import 'package:flutter/material.dart';
import 'modules/autenticacao/login/login_page.dart';
import 'modules/autenticacao/register/register_page.dart';
import 'modules/cadastro_medicamentos/cadastro_de_cuidador/cadastro_medicamentos_page.dart';
import 'modules/cadastro_medicamentos/cadastro_de_cuidador/grade_cadastro_medicamento_page.dart';
import 'modules/cadastro_medicamentos/cadastro_de_cuidador/lista_pacientes_cadastro_medicamentos_page.dart';
import 'modules/cadastro_medicamentos/cadastro_de_paciente/grade_cadastro_medicamento_paciente_page.dart';
import 'modules/consultas/consultas_home_page.dart';
import 'modules/dispenser/caixa_medicamentos/caixa1_medicamentos_page.dart';
import 'modules/dispenser/caixa_medicamentos/detalhes_medicamento.dart';
import 'modules/dispenser/dispenser_cuidador/dispenser_cuidador_list_page.dart';
import 'modules/dispenser/tela_wifi_page.dart';
import 'modules/exames/home_exames_page.dart';
import 'modules/home/home_page.dart';
import 'modules/rede/cuidador_rede/cadastro_pacientes_page.dart';
import 'modules/rede/cuidador_rede/cuidador_rede_page.dart';
import 'modules/rede/paciente_rede/cadastro_cuidador_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF29B7F6),
      ),
      routes: {
        '/': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        '/registro': (_) => RegisterPage(),
        '/rede_paciente': (_) => PacienteRedePage(),
        '/rede_cuidador': (_) => CudadorRedePage(),
        '/cadastro_pacientes': (_) => CadastroPacientesPage(),
        '/cadastro_cuidadores': (_) => CadastroCuidadoresPage(),
        '/tela_wifi': (_) => TelaWifiPage(),
        '/caixa1_medicamento': (_) => Caixa1MedicamentoPage(),
        '/lista_pacientes_cadastro_medicamento': (_) => ListaPacientesCadastroMedicamentoPage(),
        '/grade_cadastro_medicamento': (_) => GradeCadastroMedicamentoPage(),
        '/cadastro_medicamento': (_) => CadastroMedicamentoPage(),
        '/dispenser_cuidador_list': (_) => DispenserCuidadorListPage(),
        '/detalhes_medicamento': (_) => DetalhesMedicamentoPage(),
        '/grade_cadastro_medicamento_paciente': (_) => GradeCadastroMedicamentoPacientePage(),
        '/consulta_home': (_) => ConsultaHomePage(),
        '/exame_home': (_) => HomeExamesPage(),
      },
    );
  }
}
