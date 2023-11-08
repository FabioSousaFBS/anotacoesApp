import 'package:anotacoesapp/core/estilos/estilos_constantes.dart';
import 'package:anotacoesapp/core/util/generico.dart';
import 'package:flutter/material.dart';

class AnotacoesTela extends StatefulWidget {
  static const String id = 'anotacoes_screen';

  const AnotacoesTela({super.key});

  @override
  State<AnotacoesTela> createState() => _AnotacoesTelaState();
}

class _AnotacoesTelaState extends State<AnotacoesTela> {

  List<String> lstAnotacoes = ["Texto Digitado 1", "Texto Digitado 2", "Texto Digitado 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundBase,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80,),
              Card(
                color: Colors.white,
                elevation: 1,               
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: 350,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Scrollbar(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: lstAnotacoes.length,
                          itemBuilder: (_, index){
                            return Card(
                              elevation: 1,
                              child: Container(                                
                                child: Row(
                                  children: [
                                    Expanded(child: Align(
                                      alignment: Alignment.center,
                                      child: Text(lstAnotacoes[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: IconButton(
                                        onPressed: (){}, 
                                        icon: const Icon(Icons.border_color, size: 35,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: IconButton(
                                        onPressed: (){}, 
                                        icon: const Icon(Icons.cancel, size: 35, color: Colors.red,)),
                                    )
                                  
                                  ],
                                  
                                ),
                              )
                            );
                          },
                          
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {

                },                
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Digite seu texto", 
                  hintStyle: TextStyle(color: Colors.black),                  
                ),
                style: kTextField,
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

    );
  }
  
}