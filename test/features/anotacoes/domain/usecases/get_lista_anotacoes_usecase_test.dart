import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:anotacoesapp/features/anotacoes/domain/repositories/anotacoes_repository.dart';
import 'package:anotacoesapp/features/anotacoes/domain/usecases/get_lista_anotacoes_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAnotacoesRepository extends Mock implements IAnotacoesRepository{}

void main() {
  
  late GetListaAnotacoesUsecase usecase;
  late IAnotacoesRepository repository;

  setUp((){
    repository = MockAnotacoesRepository();
    usecase = GetListaAnotacoesUsecase(repository);
  });

  var tListaAnotacoes = [AnotacoesEntity(idUser: "1", texto: "texto 1"), AnotacoesEntity(idUser: "1", texto: "texto 2")];
  var tParametro = "1";

  test("Deve retornar uma lista de anotações do repository", () async {
    when(() => repository.getAnotacoesUsuario(tParametro))
      .thenAnswer((_) async => Right(tListaAnotacoes));

    final result = await usecase(tParametro);

    expect(result, Right(tListaAnotacoes));

    verify(() => repository.getAnotacoesUsuario(any())).called(1);

    verifyNoMoreInteractions(repository);

  });

  test("Deve retornar um failure em caso de não sucesso", () async {
    when(() => repository.getAnotacoesUsuario(tParametro))
      .thenAnswer((_) async => Left<Failure, List<AnotacoesEntity>>(CacheFailure()));
    
    final result = await usecase(tParametro);
    
    expect(result, Left(CacheFailure()));

    verify(() => repository.getAnotacoesUsuario(tParametro)).called(1);

    verifyNoMoreInteractions(repository);

  });
 
}