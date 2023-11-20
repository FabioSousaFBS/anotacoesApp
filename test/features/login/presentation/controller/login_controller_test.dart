import 'package:anotacoesapp/features/login/domain/usecases/get_usuarios_para_autenticacao_usecase.dart';
import 'package:anotacoesapp/features/login/presentation/controller/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUsuariosParaAutenticacaoUsecase extends Mock implements GetUsuariosParaAutenticacaoUsecase{}

void main() {

    late LoginController controller;
    late GetUsuariosParaAutenticacaoUsecase mockUsecase;

    setUp((){
      mockUsecase = MockGetUsuariosParaAutenticacaoUsecase();
      controller = LoginController(mockUsecase);      
    });

    bool tUsuarioLogado = true;

    test("Deve retornar true ao executar o método logar da controller", () async {
      when(() => controller.logar());
      
      expect(tUsuarioLogado, controller.usuarioLogado);

    });




}