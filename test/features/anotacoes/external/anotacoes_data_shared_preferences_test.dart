import 'package:anotacoesapp/core/constantes/constantes_sistema.dart';
import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/core/shared_preferences/shared_preferences.dart';
import 'package:anotacoesapp/features/anotacoes/data/datasources/anotacoes_datasource.dart';
import 'package:anotacoesapp/features/anotacoes/data/model/anotacoes_model.dart';
import 'package:anotacoesapp/features/anotacoes/external/anotacoes_data_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../mocks/anotacoes_mock.dart';

class MockSharedPreferences extends Mock implements SharedPref {}

void main() {
  
  late IAnotacoesDatasource datasource;
  late MockSharedPreferences mockSharedPreferences;

  setUp((){
    mockSharedPreferences = MockSharedPreferences();
    datasource = AnotacoesDatasourceImpl(mockSharedPreferences);
  });

  var tListaAnotacoes = [AnotacoesModel(idUser: "1", id: 1, texto: "texto 1"), AnotacoesModel(idUser: "1", id: 2, texto: "texto 2")];
  var tParametro = "1";

  test("Deve retornar um list de Anotações", () async {
    when(() => datasource.getAnotacoesUsuario(tParametro))
      .thenAnswer((_) async => tListaAnotacoes);

    final result = datasource.getAnotacoesUsuario(tParametro);

    expect(result, tListaAnotacoes);   

  });

  test(
    'Deve retornar uma string do SharedPreferences quanto tiver informações em cache',
    () async {
      
      when(mockSharedPreferences.read(ConstantesSitema.listaAnotacoes))
          .thenReturn(anotacoesMock);
      
      final result = await datasource.getAnotacoesUsuario(any());
      
      verify(mockSharedPreferences.read(ConstantesSitema.listaAnotacoes));
      expect(result, equals(anotacoesMock));
    },
  );


  test('deve lançar um CacheException quando não haver valor em cache', () {
  
    when(mockSharedPreferences.read(any())).thenReturn(null);

    final call = datasource.getAnotacoesUsuario(any());
  
    expect(call, throwsA(TypeMatcher<CacheException>()));
  });


}