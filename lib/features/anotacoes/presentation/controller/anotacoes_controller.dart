
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:anotacoesapp/features/anotacoes/domain/usecases/get_lista_anotacoes_usecase.dart';
import 'package:anotacoesapp/features/anotacoes/domain/usecases/remove_lista_anotacoes_usecase.dart';
import 'package:anotacoesapp/features/anotacoes/domain/usecases/salvar_lista_anotacoes_usecase.dart';
import 'package:mobx/mobx.dart';

part 'anotacoes_controller.g.dart';

class AnotacoesController = AnotacoesControllerBase with _$AnotacoesController;

abstract class AnotacoesControllerBase with Store{

  late GetListaAnotacoesUsecase usecaseListaAnotacoes;
  late RemoverListaAnotacoesUsecase usecaseRemoveListaAnotacoes;
  late SalvarListaAnotacoesUsecase usecaseSalvarListaAnotacoes;
  
  AnotacoesControllerBase(
    this.usecaseListaAnotacoes, 
    this.usecaseSalvarListaAnotacoes, 
    this.usecaseRemoveListaAnotacoes);

  @observable
  bool carregando = false;
  
  @observable
  bool carregandoAnotacao = false;

  @observable
  String errorMessage = "";
  
  ObservableList<AnotacoesEntity> lstAnotacoes = ObservableList();

  @observable
  ObservableFuture<List<AnotacoesEntity>>? _listaAnotacoesFuture;

  @observable
  int indexSelecionado = -1;

  @action
  setAnotacaoSelecionada(int index) => indexSelecionado = index;
 
  Future<void> getAnotacoes(String id) async {
    
    var result = await usecaseListaAnotacoes.call(id);

    result.fold(
      (error) => throw Exception(error), 
      (success){
        lstAnotacoes.clear();        
        lstAnotacoes.addAll(success);        
      }
    );

    throw Exception();

  }
   

  @action 
  Future<void> salvarAnotacoes(AnotacoesEntity anotacao) async {
    try {
      errorMessage = "";
      await usecaseSalvarListaAnotacoes.call(anotacao);

      await getAnotacoes(anotacao.idUser!);     
      
    } catch (e) {      
      errorMessage = "Houve um problema ao Salvar";
    }   
  }


  @action 
  Future<void> removerAnotacoes(AnotacoesEntity anotacao) async {
    try {      
      errorMessage = "";
      await usecaseRemoveListaAnotacoes.call(anotacao);
      //await getAnotacoes(anotacao.idUser!);
      
    } catch (e) {      
      errorMessage = "Houve um problema ao remover";
    }   
  } 

}