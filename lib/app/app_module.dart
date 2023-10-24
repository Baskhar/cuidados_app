import 'package:cuidados_app/app/app_widget.dart';
import 'package:cuidados_app/app/models/login/tipo_login.dart';
import 'package:cuidados_app/app/models/pacientes/cadastro_pacientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/caixa_medicamentos/lista_medicamentos_model.dart';
import 'models/consultas/lista_consultas_provider.dart';
import 'models/cuidadores/cadastro_cuidadores.dart';
import 'models/exames/lista_exames_provider.dart';
import 'models/login/nome_user.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TipoLogin>(
          create: (context) => TipoLogin(),
        ),
        ChangeNotifierProvider<CadastroPacientes>(
          create: (context) => CadastroPacientes(),
        ),
        ChangeNotifierProvider<CadastroCuidadores>(
          create: (context) => CadastroCuidadores(),
        ),
        ChangeNotifierProvider<ListaMedicamentosModel>(
          create: (_) => ListaMedicamentosModel(),
        ),
        ChangeNotifierProvider<ConsultasProvider>(
          create: (_) => ConsultasProvider(),
        ),
        ChangeNotifierProvider<ExamesProvider>(
          create: (_) => ExamesProvider(),
        ),
        ChangeNotifierProvider<NomeUser>(
          create: (_) => NomeUser(),
        ),
      ],
      child: AppWidget(),
    );
  }
}
