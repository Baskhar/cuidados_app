import 'package:flutter/material.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controllerNome = TextEditingController();
  final controllerData = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();
  final controllerConfSenha = TextEditingController();



  final controllerTelefone = TextEditingController();
  final controllerUsuario = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    //ao sair da tela eu removo esses controlladores
    controllerNome.dispose();
    controllerData.dispose();
    controllerEmail.dispose();
    controllerSenha.dispose();
    controllerConfSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Crie sua conta'),
        //cor da app bar
        backgroundColor: Theme.of(context).primaryColor,
        //cor dos componentes dela
       
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(right: 10,left: 10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controllerNome,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(
                          //borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (nome) {
                        if (nome == null || nome.isEmpty) {
                          return 'Digite seu nome';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          //borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Digite seu e-mail';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controllerData,
                      decoration: InputDecoration(
                        labelText: 'Data de Nascimento',
                        border: OutlineInputBorder(
                         // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'Digite sua data de nascimento';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controllerTelefone,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        border: OutlineInputBorder(
                       //   borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (telefone) {
                        if (telefone == null || telefone.isEmpty) {
                          return 'Digite o seu telefone';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controllerUsuario,
                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        border: OutlineInputBorder(
                          //borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (usuario) {
                        if (usuario == null || usuario.isEmpty) {
                          return 'Digite o seu usuário';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controllerSenha,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                         // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (senha) {
                        if (senha == null || senha.isEmpty) {
                          if (senha != controllerConfSenha.text) {
                            return 'As senhas não coincidem';
                          }
                          return 'Digite sua senha';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controllerConfSenha,
                      decoration: InputDecoration(
                        labelText: 'Confirmar senha',
                        border: OutlineInputBorder(
                      //    borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (confsenha) {
                        if (confsenha == null || confsenha.isEmpty) {
                          if (confsenha != controllerSenha.text) {
                            return 'As senhas não coincidem';
                          }
                          return 'Digite sua senha';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    // Define o raio de borda desejado
                    ),
                  ), // Define a largura e a cor da borda,
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                          (Set<MaterialState> states) {
                    return EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20); // Padding padrão do botão
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    return Theme.of(context).primaryColor; // Cor padrão do botão
                  }),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //nevega para a tela login
                    Navigator.of(context).pushNamed('/');
                  }
                },
                child: Text('Salvar',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
