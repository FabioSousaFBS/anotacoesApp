// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/core/usecase/usecase.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:anotacoesapp/features/anotacoes/domain/repositories/anotacoes_repository.dart';

class GetListaAnotacoesUsecase implements Usecase<List<AnotacoesEntity>, String> {

  final IAnotacoesRepository repository;
  
  GetListaAnotacoesUsecase(this.repository);

  @override
  Future<Either<Failure, List<AnotacoesEntity>>> call(String params) async {
    return await repository.getAnotacoesUsuario(params);
  }  

}

