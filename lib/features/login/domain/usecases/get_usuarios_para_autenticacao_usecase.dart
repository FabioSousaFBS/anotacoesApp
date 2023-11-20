import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/core/usecase/usecase.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';
import 'package:anotacoesapp/features/login/domain/repositories/autenticacao_repository.dart';
import 'package:dartz/dartz.dart';

class GetUsuariosParaAutenticacaoUsecase implements Usecase<List<UsuarioEntity>, NoParams> {
    
  final IAutenticacaoRepository repository;

  GetUsuariosParaAutenticacaoUsecase(this.repository);

  @override
  Future<Either<Failure, List<UsuarioEntity>>> call(NoParams params) async {
    return await repository.obterTodosOsUsuarios();
  }


}