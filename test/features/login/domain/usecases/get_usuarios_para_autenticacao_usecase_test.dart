import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/core/usecase/usecase.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';
import 'package:anotacoesapp/features/login/domain/repositories/autenticacao_repository.dart';
import 'package:anotacoesapp/features/login/domain/usecases/get_usuarios_para_autenticacao_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAutenticacaoRepository extends Mock implements IAutenticacaoRepository{}

void main() {

    late GetUsuariosParaAutenticacaoUsecase usecase;
    late IAutenticacaoRepository repository;

    setUp((){
      repository = MockAutenticacaoRepository();
      usecase = GetUsuariosParaAutenticacaoUsecase(repository);

    });

    var tUsuario = [UsuarioEntity(id: "1", name: "Fabio", password: "password1")];
    var tNoParams = NoParams();

    test("Deve retornar uma Lista de Usuarios do repository", 
    () async {
      when(() => repository.obterTodosOsUsuarios())
        .thenAnswer((_) async => Right(tUsuario));

      final result = await usecase(NoParams());

      expect(result, Right(tUsuario));

      verify(() => repository.obterTodosOsUsuarios()).called(1);

      verifyNoMoreInteractions(repository);
      
    });
  

    test('Deve retornar um objeto failure em caso de não sucesso', () async {

      when(() => repository.obterTodosOsUsuarios())
          .thenAnswer((_) async => Left<Failure, List<UsuarioEntity>>(ServerFailure() ));
        
        final result = await usecase(tNoParams);
        
        expect(result, Left(ServerFailure()));
        
        verify(() => repository.obterTodosOsUsuarios()).called(1);
        
        verifyNoMoreInteractions(repository);    

    } );




}