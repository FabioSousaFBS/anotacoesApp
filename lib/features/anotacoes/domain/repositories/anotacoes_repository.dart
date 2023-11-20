import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IAnotacoesRepository {

  Future<Either<Failure, List<AnotacoesEntity>>> getAnotacoesUsuario(String id);

  Future<Either<Failure, bool>> salvarAnotacoesUsuario(AnotacoesEntity anotacao);
  
  Future<Either<Failure, bool>> removerAnotacoesUsuario(AnotacoesEntity anotacao);

}