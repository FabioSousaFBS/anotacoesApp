import 'dart:convert';

import 'package:anotacoesapp/features/anotacoes/domain/entities/anotacoes_entity.dart';

class AnotacoesModel extends AnotacoesEntity{

  AnotacoesModel({
    required String idUser,
    required int id,
    required String texto
  }) : super (
    idUser: idUser,
    id: id,
    texto: texto
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'id': id,
      'texto': texto,     
    };
  }

  factory AnotacoesModel.fromMap(Map<String, dynamic> map) {
    return AnotacoesModel(
      idUser: map['idUser'] ?? '',
      id: map['id'] ?? '',
      texto: map['texto'] ?? '',      
    );
  }

  

  factory AnotacoesModel.fromJson(String data) => AnotacoesModel.fromMap(json.decode(data) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());


}