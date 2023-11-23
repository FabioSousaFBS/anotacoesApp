import 'package:anotacoesapp/core/estilos/estilos_constantes.dart';
import 'package:anotacoesapp/core/util/generico.dart';
import 'package:anotacoesapp/core/widgets/snackbar.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:anotacoesapp/features/anotacoes/presentation/controller/anotacoes_controller.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';
import 'package:anotacoesapp/features/login/presentation/widgets/confirma_exclusao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class AnotacoesTela extends StatefulWidget {
  final UsuarioEntity user;

  const AnotacoesTela({super.key, required this.user});

  @override
  State<AnotacoesTela> createState() => _AnotacoesTelaState();
}

class _AnotacoesTelaState extends State<AnotacoesTela> {
  
  late AnotacoesController controller;
  late List<ReactionDisposer> reactionDisposer;

  final FocusNode textoFocusNode = FocusNode();

  TextEditingController digitacaoController = TextEditingController();

  @override
  void didChangeDependencies() {    
    super.didChangeDependencies();

    controller = GetIt.I.get<AnotacoesController>();

    controller.getAnotacoes(widget.user.id!);

    FocusScope.of(context).requestFocus(textoFocusNode);

    reactionDisposer =  [               
      reaction(
        (_) => controller.errorMessage, 
        (_) {
          if (controller.errorMessage.isNotEmpty) {
            showSnackBarException(context, controller.errorMessage);
            controller.errorMessage = "";
          }
        }),
      ];
  }

  @override
  void dispose() {
    for (var disposer in reactionDisposer) {
      disposer();
    }
    textoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    FocusScopeNode foco = FocusScope.of(context);

    return Scaffold(
      body: Container(
        decoration: kBackgroundBase,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 80,
              ),
              Flexible(
                child: Card(
                  color: Colors.white,
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Observer(                    
                      builder: (context) {
                        return Container(
                          height: 350,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Scrollbar(
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.lstAnotacoes.length,
                                itemBuilder: (context, index) {
                                  if (controller.lstAnotacoes.isEmpty) {
                                    return Container();
                                  } else {
                                    return Card(
                                        elevation: 1,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        controller.lstAnotacoes[index].texto ?? "",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ))),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.setAnotacaoSelecionada(index);
                                                      digitacaoController.text = controller.lstAnotacoes[index].texto ?? "";
                                                      foco.requestFocus(textoFocusNode);
                                                    },
                                                    icon: const Icon(
                                                      Icons.border_color,
                                                      size: 35,
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: IconButton(
                                                  onPressed: () async {
                                                    
                                                    bool resposta = await showModalBottomSheet(            
                                                      context: context, 
                                                      isScrollControlled: true,
                                                      builder: (context) => SingleChildScrollView(
                                                        child: Container(
                                                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                          child: const ConfirmaExclusao(),
                                                        ),
                                                      ),
              
                                                    );
                                                    if (resposta) {
                                                      await controller.removerAnotacoes(controller.lstAnotacoes[index]);
                                                      digitacaoController.text = "";                                                    
                                                    }
                                                    foco.requestFocus(textoFocusNode);
                                                  },
                                                  icon: const Icon(
                                                    Icons.cancel,
                                                    size: 35,
                                                    color: Colors.red,
                                                  )
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      );                                  
                                  }
                                },
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: digitacaoController,
                focusNode: textoFocusNode,
                autofocus: true,
                keyboardType: TextInputType.name,                
                onSubmitted: (value) async {
                  if (controller.indexSelecionado != -1) {
                    controller.lstAnotacoes[controller.indexSelecionado].texto = digitacaoController.text;
                    await controller.usecaseSalvarListaAnotacoes(controller.lstAnotacoes[controller.indexSelecionado]);
                  }else{
                    AnotacoesEntity anotacao = AnotacoesEntity(id: 0, idUser: widget.user.id, texto: digitacaoController.text);
                    await controller.usecaseSalvarListaAnotacoes(anotacao);
                  }
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Digite seu texto",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: kTextField,
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
}
