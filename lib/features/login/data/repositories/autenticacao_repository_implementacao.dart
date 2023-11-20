
import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/features/login/data/datasources/autenticacao_datasource.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';
import 'package:anotacoesapp/features/login/domain/repositories/autenticacao_repository.dart';
import 'package:dartz/dartz.dart';

class AutenticacaoRepositoryImplementacao implements IAutenticacaoRepository{
  
  final IAutenticacaoDatasource datasource;

  AutenticacaoRepositoryImplementacao(this.datasource);

  @override
  Future<Either<Failure, List<UsuarioEntity>>> obterTodosOsUsuarios() async {
    
    try {
        final result = await  datasource.obterTodosOsUsuarios();
        
        return Right(result);

    } on ServerException {
      return Left(ServerFailure());
    }
    
  }


}
