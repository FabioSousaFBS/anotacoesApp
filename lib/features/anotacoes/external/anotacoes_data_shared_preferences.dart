import 'package:anotacoesapp/core/constantes/constantes_sistema.dart';
import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/core/shared_preferences/shared_preferences.dart';
import 'package:anotacoesapp/features/anotacoes/data/datasources/anotacoes_datasource.dart';
import 'package:anotacoesapp/features/anotacoes/data/model/anotacoes_model.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotacoesDatasourceImpl implements IAnotacoesDatasource{

  final SharedPref sharedPreferences;

  AnotacoesDatasourceImpl(this.sharedPreferences);
  
  @override
  Future<List<AnotacoesModel>> getAnotacoesUsuario(String id)  async {
    try {
      var listaData = await sharedPreferences.read(ConstantesSitema.listaAnotacoes);

      List<AnotacoesModel> listaAux = [];

      listaData.forEach((i) => listaAux.add(AnotacoesModel.fromMap(i)));

      return listaAux.where((e) => e.idUser == id).toList();
      
    } catch (e) {
      throw CacheException();
    }

  }

  @override
  Future<bool> salvarAnotacoesUsuario(AnotacoesEntity anotacao) async {

    try {      
      var listaData = await sharedPreferences.read(ConstantesSitema.listaAnotacoes);
      List<AnotacoesModel> listaAux = [];

      listaData.forEach((i) => listaAux.add(AnotacoesModel.fromMap(i)));

      if (anotacao.id == 0) {
        anotacao.id = listaAux.length + 1;
        listaAux.add(anotacao.toModel());

        await sharedPreferences.save(ConstantesSitema.listaAnotacoes, listaAux);

      } else {
         int index = listaAux.indexWhere((e) => e.id == anotacao.id);

        if(index > 0){
          listaAux[index].texto = anotacao.texto;
          await sharedPreferences.save(ConstantesSitema.listaAnotacoes, listaAux);
        }else{
          throw CacheException();
        }

      }

      return true;

    } catch (e) {
      throw CacheException();
    }
    

  }
  
  @override
  Future<bool> removerAnotacoesUsuario(AnotacoesEntity anotacao) async {
    try {      
      var listaData = await sharedPreferences.read(ConstantesSitema.listaAnotacoes);
      List<AnotacoesModel> listaAux = [];

      listaData.forEach((i) => listaAux.add(AnotacoesModel.fromMap(i)));
     
      int index = listaAux.indexWhere((e) => e.id == anotacao.id);
      
      if(index > 0){        
        listaAux.remove(listaAux[index]);
        await sharedPreferences.save(ConstantesSitema.listaAnotacoes, listaAux);
      }else{
        throw CacheException();
      }     

      return true;

    } catch (e) {
      throw CacheException();
    }
    
  }



}

