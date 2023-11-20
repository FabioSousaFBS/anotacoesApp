import 'dart:convert';

import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';


class UsuarioModel extends UsuarioEntity{

  UsuarioModel({
    required String id, 
    required String name, 
    required String password
  }) : super (
    id: id,
    name: name,
    password: password
  );
  
  factory UsuarioModel.fromMap(Map<String, dynamic> data) => UsuarioModel(
        name: data['name'] ?? "",
        password: data['password'] ?? "",
        id: data['id'] ?? "",
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'password': password,
        'id': id,
      };

  factory UsuarioModel.fromJson(String data) => UsuarioModel.fromMap(json.decode(data) as Map<String, dynamic>);
  

  String toJson() => json.encode(toMap());

}