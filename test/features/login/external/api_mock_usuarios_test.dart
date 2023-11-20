import 'package:anotacoesapp/core/dio_client/dio_client.dart';
import 'package:anotacoesapp/core/dio_client/dio_client_implementacao.dart';
import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/features/login/data/datasources/autenticacao_datasource.dart';
import 'package:anotacoesapp/features/login/external/api_mock_usuarios.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/usuario_mock.dart';


class DioClientMock extends Mock implements DioClientImplementacao {}


void main() {
  
  late IAutenticacaoDatasource datasource;
  late DioClientImplementacao client;

  setUp((){
    client = DioClientMock();
    datasource = ApiUsuarioDatasource(client);

  });

  const urlExpected = 'https://65477416902874dff3ac4fc4.mockapi.io/usuario/';

  test("Deve chamar o método get com a url correta", () async {
    sucessoMock(client);

    await datasource.obterTodosOsUsuarios();

    verify(() => client.get(urlExpected)).called(1);

  });

  test("Deve retornar uma lista de Usuarios quando chamado o método obter Todos", () async {
    sucessoMock(client);
    
    final result = await datasource.obterTodosOsUsuarios();

    expect(result, tListaUsuariosModel);

  });


  test("Deve retornar uma exceção em caso de não sucesso", () async {
     when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: 'algo deu errado', statusCode: 400));
    
    final result = datasource.obterTodosOsUsuarios();

    expect(() => result, throwsA(ServerException()));

  });

}

void sucessoMock(DioClient client) {
  when(() => client.get(any())).thenAnswer((_)async => HttpResponse(data: listUsuarioMock, statusCode: 200));
}

