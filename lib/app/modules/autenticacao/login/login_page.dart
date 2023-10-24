import 'package:cuidados_app/app/models/login/nome_user.dart';
import 'package:cuidados_app/app/models/login/tipo_login.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//Tela de logib
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  // final dropvalue = ValueNotifier('');
  //
  // //lista de opções
  // final dropOpcoes = ['Itau', 'Banco do Brasil'];

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //controladores de texto, varáveis que vão armazenar o que o usuário digitar
    final controllerUser = TextEditingController();
    final controllerSenha = TextEditingController();
    final tipoLoginProvider = Provider.of<TipoLogin>(context);
    final nomeUserProvider = Provider.of<NomeUser>(context);
    String? tipoLogin;
    Color primaryColor = Theme.of(context).primaryColor;

    //chave de validação dos campos(TextFormField)
    final _formKey = GlobalKey<FormState>();
    //scafold(classe) carrega váris componentes da minha página
    //ex. app bar, botão flutuante, menu lateral, menu em baixo da tela botões e etc..
    return Scaffold(
      //widget resposável por permitir a rolagem
      body: Container(
        padding: EdgeInsets.only(top: 35),
        constraints: BoxConstraints.expand(),
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
        child: SingleChildScrollView(
          //widget repostável por permitir a validação dos campos
          child: Form(
            //chave de validação
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  color: Colors.white,
                ),
                //Image.asset('real.jpg'),
                //Widgets que regula a posição dos outros Widgets na tela
                // Padding(
                //   //definindo um espaço de 50 pra cima
                //   padding: const EdgeInsets.only(top: 50),
                //   //imagem da net
                //   child: Image.network(
                //     'https://cdn-icons-png.flaticon.com/512/35/35714.png?w=740&t=st=1685061991~exp=1685062591~hmac=71f917dac973ff4fa07dcacbd2127ebf2ae0ab50f7b2d97ce3cd1c329cf62ae5',
                //     height: 75,
                //   ),
                // ),
                //wiget que da espaçamento
                SizedBox(
                  height: 10,
                ),
                //widget de texto
                Text(
                  'Faça login ou crie uma conta',
                  //estilizando o texto
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                //widget container, repostável por modelar outros widgets
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        //passando o controller
                        controller: controllerUser,

                        //definindo o estilo do input do campo
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,

                          ),

                          //nome padrão do campo
                          hintText: 'Login',

                          hintStyle: TextStyle(color: Colors.white),
                          // Define a cor do hint text

                        ),
                        //validando pra vê se ele está preenchido
                        validator: (Email) {
                          if (Email == null || Email.isEmpty) {
                            return 'Digite seu Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controllerSenha,
                        decoration: InputDecoration(

                          hintText: 'Senha',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,

                          ),
                        ),
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Digite sua Senha';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        value: tipoLogin,

                        decoration: InputDecoration(

                            filled: true,
                            fillColor: Colors.white.withOpacity(0.15),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,

                            ),

                            hintText: 'Tipo de Login',hintStyle: TextStyle(
                          color: Colors.white
                        )),
                        items: [
                          DropdownMenuItem<String>(
                            value: 'cuidador',
                            child: Text('Cuidador'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'paciente',
                            child: Text('Paciente'),
                          ),
                        ],
                        onChanged: (value) {
                          tipoLogin = value;

                          tipoLoginProvider.tipoLogin = value!;
                        },
                        validator: (tipo) {
                          if (tipo == null || tipo.isEmpty) {
                            return 'Selecione o tipo de login';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //botão de acessar
                ElevatedButton(
                    //personalizando o botão
                    style: ButtonStyle(
                      // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //   RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(
                      //         1), // Define o raio de borda desejado
                      //   ),
                      // ), // Define a largura e a cor da borda,
                      padding: MaterialStateProperty.resolveWith<
                          EdgeInsetsGeometry?>((Set<MaterialState> states) {
                        return EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 145); // Padding padrão do botão
                      }),
                      //cor do botao
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                        return primaryColor; // Cor padrão do botão
                      }),
                    ),
                    //ao pressionar o botao
                    onPressed: () {
                      //ele vai validar se todos as validações estão corretas se sim ele vai navegar para a página home
                      if (_formKey.currentState!.validate()) {
                        nomeUserProvider.setNomeUser = controllerUser.text;
                        Navigator.of(context).pushNamed('/home');
                      }
                    },
                    //texto
                    child: Text(
                      'ENTRAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/registro');
                  },
                  style: ButtonStyle(
                    // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //   RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(
                    //         1), // Define o raio de borda desejado
                    //   ),
                    // ), // Define a largura e a cor da borda,
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                            (Set<MaterialState> states) {
                      return EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 118); // Padding padrão do botão
                    }),
                    //cor do botao
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return primaryColor; // Cor padrão do botão
                    }),
                  ),
                  child: Text(
                    'CRIE SUA CONTA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )

                // Container(
                //   alignment: Alignment.bottomCenter,
                //   padding: EdgeInsets.only(bottom: 20),
                //   child: TextButton(
                //     //se o botão for pressionado ele vai pra página de registro
                //     onPressed: () {
                //       Navigator.of(context).pushNamed('/registro');
                //     },
                //     child: Text(
                //       'Não possuo cadastro',
                //       style: TextStyle(
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
