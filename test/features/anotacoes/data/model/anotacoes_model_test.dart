import 'package:anotacoesapp/features/anotacoes/data/model/anotacoes_model.dart';
import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/anotacoes_mock.dart';



void main() {
  
  final tAnotacaoModel = AnotacoesModel(idUser: '1', id: 1, texto: 'Texto 1');

  test("Deve ser uma subclasse de AnotacoesEntity", (){

    expect(tAnotacaoModel, isA<AnotacoesEntity>());

  });


  test("Deve retornar um modelo valido", (){
          
    final result = AnotacoesModel.fromJson(anotacaoMock);

    expect(result, tAnotacaoModel);


  });

  test("Deve retornar um json map contendo uma Anotacao ", (){

    final expectMap = {
      "idUser":'1',
      "id": 1,
      "texto":'Texto 1'
    };

    final result = tAnotacaoModel.toMap();

    expect(result, expectMap);
    //expect(actual, matcher)

  });


}