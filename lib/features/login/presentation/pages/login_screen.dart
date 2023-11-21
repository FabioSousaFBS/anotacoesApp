import 'package:anotacoesapp/core/estilos/estilos_constantes.dart';
import 'package:anotacoesapp/core/util/generico.dart';
import 'package:anotacoesapp/core/widgets/snackbar.dart';
import 'package:anotacoesapp/features/login/presentation/controller/login_controller.dart';
import 'package:anotacoesapp/features/anotacoes/presentation/pages/anotacoes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({super.key});

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  
  late LoginController controller;
  late List<ReactionDisposer> reactionDisposer;

  @override
  void didChangeDependencies() {    
    super.didChangeDependencies();

    controller = GetIt.I.get<LoginController>();

    reactionDisposer =  [
      reaction(
        (_) => controller.usuarioLogado, 
        (_) {
          if (controller.usuarioLogado) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AnotacoesTela(user: controller.usuario)));           
          } 
        }),      
      reaction(
        (_) => controller.mensagemErro, 
        (_) {
          if (controller.mensagemErro.isNotEmpty) {
            showSnackBarException(context, controller.mensagemErro);
          } 
        }),
      ];
  }

  @override
  void dispose() {
    for (var disposer in reactionDisposer) {
      disposer();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return ModalProgressHUD(
            color: Colors.blueGrey.shade200,
            inAsyncCall: controller.carregando,
            child: Container(
              decoration: kBackgroundBase,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 300,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        "Usuário",
                        style: kLabelStyle,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.name,
                      onChanged: controller.setUser,
                      maxLength: 20,
                      decoration: kTextFieldDecoration.copyWith(
                        prefixIcon: const Icon(Icons.person),
                      ),
                      style: kTextField,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        "Senha",
                        style: kLabelStyle,
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      onChanged: controller.setSenha,
                      style: kTextField,
                      maxLength: 20,
                      decoration: kTextFieldDecoration.copyWith(
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 70),
                      child: Material(
                        color: const Color.fromARGB(156, 68, 189, 1),
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        child: MaterialButton(
                          onPressed: controller.dadosValidados
                            ? () {                              
                              controller.logar();
                            }
                            : null,
            
                          minWidth: 200.0,
                          height: 42.0,
                          child: const Text(
                            'Entrar',
                            style: kLabelStyle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: InkWell(
                                onTap: Generico().abrirLinkBrowser,
                                child: const Text(
                                  "Política de Privacidade",
                                  style: kLabelStyle,
                                ),
                              ),
                            ))),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
