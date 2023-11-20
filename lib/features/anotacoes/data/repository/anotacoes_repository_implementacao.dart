// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/features/anotacoes/data/datasources/anotacoes_datasource.dart';
import 'package:dartz/dartz.dart';

import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:anotacoesapp/features/anotacoes/domain/repositories/anotacoes_repository.dart';

class AnotacoesRepositoryImplementacao implements IAnotacoesRepository {
  
  final IAnotacoesDatasource datasource;

  AnotacoesRepositoryImplementacao(this.datasource);
  
  @override
  Future<Either<Failure, List<AnotacoesEntity>>> getAnotacoesUsuario(String id) async {
    try {
      final result = await datasource.getAnotacoesUsuario(id);

      return Right(result);

    } on CacheException {
      return Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> salvarAnotacoesUsuario(AnotacoesEntity anotacao) async {
    try {
      final result = await datasource.salvarAnotacoesUsuario(anotacao);

      return Right(result);

    } on CacheException {
      return Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> removerAnotacoesUsuario(AnotacoesEntity anotacao) async {
    try {
      final result = await datasource.removerAnotacoesUsuario(anotacao);

      return Right(result);

    } on CacheException {
      return Left(CacheFailure());
    }
  }

}
