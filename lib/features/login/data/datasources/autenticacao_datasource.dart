
import 'package:anotacoesapp/features/login/data/models/usuario_model.dart';

abstract class IAutenticacaoDatasource{

  Future<List<UsuarioModel>> obterTodosOsUsuarios();
  

}