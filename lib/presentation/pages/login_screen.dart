import 'package:anotacoesapp/core/estilos/estilos_constantes.dart';
import 'package:anotacoesapp/core/util/generico.dart';
import 'package:anotacoesapp/presentation/pages/anotacoes_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginTela extends StatefulWidget {
  static const String id = 'login_screen';
  
  const LoginTela({super.key});

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: ModalProgressHUD(
        color: Colors.blueGrey.shade200,
        inAsyncCall: showSpinner,
        child: Container(
          decoration: kBackgroundBase,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(              
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 300,),
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text("Usuário", style: kLabelStyle,),
                ),
                TextField(
                  keyboardType: TextInputType.name,
                  onChanged: (value) {},
                  decoration: kTextFieldDecoration.copyWith(prefixIcon: const Icon(Icons.person), ),
                  style: kTextField,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text("Senha", style: kLabelStyle,),
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {},
                  style: kTextField,
                  decoration: kTextFieldDecoration.copyWith(prefixIcon: const Icon(Icons.lock),),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70),
                  child: Material(
                    color: const Color.fromARGB(156, 68, 189, 1),                  
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),                    
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                
                        try {
                          // final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                
                          // if(user != null){
                          Navigator.pushNamed(context, AnotacoesTela.id);
                          // }
                
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: const Text(
                        'Entrar',
                        style: kLabelStyle,
                      ),
                    ),
                  ),
                ),                
                Expanded(child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: Generico().abrirLinkBrowser,
                      child: const Text("Política de Privacidade", style: kLabelStyle,),
                    ),
                  )
                )
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}