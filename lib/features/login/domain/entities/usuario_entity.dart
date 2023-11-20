import 'dart:convert';

import 'package:equatable/equatable.dart';

class UsuarioEntity extends Equatable {
  final String? name;
  final String? password;
  final String? id;

  UsuarioEntity({this.name, this.password, this.id});

  @override
  List<Object?> get props => [name, password, id];
}
