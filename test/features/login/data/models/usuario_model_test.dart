import 'dart:convert';

import 'package:anotacoesapp/features/login/data/models/usuario_model.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/usuario_mock.dart';

void main() {

  final tUsuarioModel = UsuarioModel(id: '1', name: 'Fabio', password: 'password1');

  test("Deve ser uma subclasse de UsuarioEntity", (){

    expect(tUsuarioModel, isA<UsuarioEntity>());

  });


  test("Deve retornar um modelo valido", (){
           
    final result = UsuarioModel.fromJson(usuarioMock);

    expect(result, tUsuarioModel);


  });

  test("Deve retornar um json map contendo um Usuario ", (){

    final expectMap = {
      "name":'Fabio',
      "password":'password1',
      "id":'1'
    };

    final result = tUsuarioModel.toMap();

    expect(result, expectMap);
    //expect(actual, matcher)

  });


}