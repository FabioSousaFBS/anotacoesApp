import 'package:anotacoesapp/features/anotacoes/data/model/anotacoes_model.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';

abstract class IAnotacoesDatasource{

  Future<List<AnotacoesModel>> getAnotacoesUsuario(String id);  

  Future<bool> salvarAnotacoesUsuario(AnotacoesEntity anotacao);  
  
  Future<bool> removerAnotacoesUsuario(AnotacoesEntity anotacao);  

}

