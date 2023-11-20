import 'package:anotacoesapp/core/errors/failures.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IAutenticacaoRepository {

  Future<Either<Failure, List<UsuarioEntity>>> obterTodosOsUsuarios();

}