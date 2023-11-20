import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/features/anotacoes/data/datasources/anotacoes_datasource.dart';
import 'package:anotacoesapp/features/anotacoes/data/model/anotacoes_model.dart';
import 'package:anotacoesapp/features/anotacoes/data/repository/anotacoes_repository_implementacao.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAnotacoesDatasource extends Mock implements IAnotacoesDatasource{}

void main() {

  late AnotacoesRepositoryImplementacao repository;
  late IAnotacoesDatasource datasource;

  setUp((){
    datasource = MockAnotacoesDatasource();
    repository = AnotacoesRepositoryImplementacao(datasource);
  });

  var tListaAnotacoes = [
    AnotacoesModel(idUser: "1", id: 1, texto: "texto 1"), 
    AnotacoesModel(idUser: "1", id: 2, texto: "texto 2")
  ];
  
  var tParametro = "1";

  test('Deve retornar um list de anotacoes model quando chama o datasource', () async {

    when(() => datasource.getAnotacoesUsuario(tParametro))
      .thenAnswer((_) async => tListaAnotacoes);


    final result = await repository.getAnotacoesUsuario(tParametro);

    expect(result, Right(tListaAnotacoes));
    verify(() => datasource.getAnotacoesUsuario(any())).called(1);

  });


  test('Deve retornar um cache failure quando o metodo reportar uma exception.', () async {

    when(() => datasource.getAnotacoesUsuario(tParametro))
        .thenThrow(CacheException());

    final result = await repository.getAnotacoesUsuario(tParametro);

    expect(result, Left(CacheFailure()));

    verify(() => datasource.getAnotacoesUsuario(any())).called(1);

  });


}