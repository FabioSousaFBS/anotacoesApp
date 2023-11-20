import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/features/login/data/datasources/autenticacao_datasource.dart';
import 'package:anotacoesapp/features/login/data/models/usuario_model.dart';
import 'package:anotacoesapp/features/login/data/repositories/autenticacao_repository_implementacao.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAutenticacaoDatasource extends Mock implements IAutenticacaoDatasource {}

void main() {

  late AutenticacaoRepositoryImplementacao repository;
  late IAutenticacaoDatasource datasource;

  setUp((){
    datasource = MockAutenticacaoDatasource();
    repository = AutenticacaoRepositoryImplementacao(datasource);
    
  });

var tUsuariosListModel = [UsuarioModel(id: "1", name: "Fabio", password: "password1")];

 test('Deve retornar um list de usuarios model quando chama o datasource', () async {

    when(() => datasource.obterTodosOsUsuarios())
      .thenAnswer((_) async => tUsuariosListModel);


    final result = await repository.obterTodosOsUsuarios();

    expect(result, Right(tUsuariosListModel));
    verify(() => datasource.obterTodosOsUsuarios()).called(1);

  });


  test('Deve retornar um server failure quando o metodo reportar uma exception.', () async {

    when(() => datasource.obterTodosOsUsuarios())
        .thenThrow(ServerException());

    final result = await repository.obterTodosOsUsuarios();

    expect(result, Left(ServerFailure()));

    verify(() => datasource.obterTodosOsUsuarios()).called(1);

  });
}

