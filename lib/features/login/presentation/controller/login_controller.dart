
import 'package:anotacoesapp/core/usecase/usecase.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';
import 'package:anotacoesapp/features/login/domain/usecases/get_usuarios_para_autenticacao_usecase.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store{

  late GetUsuariosParaAutenticacaoUsecase usecaseAutenticacao;
  
  LoginControllerBase(this.usecaseAutenticacao);


  @observable
  String user = '';

  @observable
  String senha = '';

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  @observable
  String mensagemErro = "";

  @computed
  bool get dadosValidados => user.length >= 5 && senha.length >= 5;

  @action
  void setUser(valor) => user = valor;

  @action
  void setSenha(valor) => senha = valor;


  @action
  Future<void> logar() async {
    carregando = true;
    mensagemErro = "";    
    
    var result = await usecaseAutenticacao.call(NoParams());

    result.fold(
      (error){
        mensagemErro = error.toString();
        usuarioLogado = false;
      }, 
      (success){
       
        UsuarioEntity usuario = success.firstWhere((element) => element.name!.toLowerCase() == user.toLowerCase());

        if (usuario.id != "0") {
          if(usuario.password == senha){
            usuarioLogado = true;
          }else{
            mensagemErro = "Senha incorreta!";
            usuarioLogado = false;
          }
        } else {
          mensagemErro = "Usuário não encontrado!";
          usuarioLogado = false;
        }

      });

    carregando = false;

  }

}