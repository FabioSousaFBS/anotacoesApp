import 'dart:convert';

import 'package:anotacoesapp/core/constantes/endpoint.dart';
import 'package:anotacoesapp/core/dio_client/dio_client_implementacao.dart';
import 'package:anotacoesapp/core/errors/exceptions.dart';
import 'package:anotacoesapp/features/login/data/datasources/autenticacao_datasource.dart';
import 'package:anotacoesapp/features/login/data/models/usuario_model.dart';

class ApiUsuarioDatasource implements IAutenticacaoDatasource {

  final DioClientImplementacao client;

  ApiUsuarioDatasource(this.client);
  
  @override
  Future<List<UsuarioModel>> obterTodosOsUsuarios() async {
    try {
      final response = await client.get("${EndPoint.urlBase}${EndPoint.usuario}");

      if (response.statusCode == 200) {
        List<UsuarioModel> lstUsers = [];

        response.data.forEach((i) => lstUsers.add(UsuarioModel.fromMap(i)));

        return lstUsers;

      } else {
        throw ServerException();
      }
      
    } catch (e) {
      throw ServerException();
    }

  }



}