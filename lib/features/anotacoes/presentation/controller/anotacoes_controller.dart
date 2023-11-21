
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

  @observable
  ObservableList<AnotacoesEntity> lstAnotacoes = ObservableList();

  @observable
  ObservableFuture<List<AnotacoesEntity>>? _listaAnotacoesFuture;

  @observable
  int indexSelecionado = -1;

  @action
  setAnotacaoSelecionada(int index) => indexSelecionado = index;
 
  Future<List<AnotacoesEntity>> getAnotacoes(String id) async {
    
    var result = await usecaseListaAnotacoes.call(id);

    result.fold(
      (error) => throw Exception(error), 
      (success){
        return success;
      }
    );

    throw Exception();

  }

  Future<void> carregarLista(String id) async {

    try {
      errorMessage = '';
      carregando = true; 

      List<AnotacoesEntity> listaAux = [];

      _listaAnotacoesFuture = ObservableFuture(getAnotacoes(id));
      
      listaAux = await _listaAnotacoesFuture ?? []; 

      
      do{
        if(_listaAnotacoesFuture!.status == FutureStatus.fulfilled) {          
          if(errorMessage == '') {            
            lstAnotacoes.clear();      
            lstAnotacoes.addAll(listaAux);           
            
            carregando = false;
          }
        }
      } while (carregando != false || errorMessage != '');
    } catch (e) {
      carregando = false;      
      errorMessage = e.toString();
    }
  }

  @action 
  Future<void> obterAnotacoes(String id) async {
    await carregarLista(id);
  }

  @action 
  Future<void> salvarAnotacoes(AnotacoesEntity anotacao) async {
    try {
      await usecaseSalvarListaAnotacoes.call(anotacao);

      await carregarLista(anotacao.idUser!);

      
      
    } catch (e) {      
      errorMessage = e.toString();
    }   
  }


  @action 
  Future<void> removerAnotacoes(AnotacoesEntity anotacao) async {
    try {      
      await usecaseSalvarListaAnotacoes.call(anotacao);
      await carregarLista(anotacao.idUser!);
      
    } catch (e) {      
      errorMessage = e.toString();
    }   
  } 

}