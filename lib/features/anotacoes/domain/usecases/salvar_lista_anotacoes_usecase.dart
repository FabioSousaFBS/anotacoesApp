
import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/core/usecase/usecase.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:anotacoesapp/features/anotacoes/domain/repositories/anotacoes_repository.dart';
import 'package:dartz/dartz.dart';

class SalvarListaAnotacoesUsecase implements Usecase<bool, AnotacoesEntity> {

  final IAnotacoesRepository repository;
  
  SalvarListaAnotacoesUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(AnotacoesEntity params) async {
    return await repository.salvarAnotacoesUsuario(params);
  }

}