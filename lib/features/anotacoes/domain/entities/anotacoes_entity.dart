
import 'package:anotacoesapp/features/anotacoes/data/model/anotacoes_model.dart';
import 'package:equatable/equatable.dart';

class AnotacoesEntity extends Equatable {
  final String? idUser;
  int? id;
  String? texto;

  AnotacoesEntity({this.idUser, this.id = 0, this.texto});

  AnotacoesModel toModel() => AnotacoesModel(idUser: this.idUser ?? "", id: this.id ?? 0, texto: this.texto ?? "");
  
  @override
  List<Object?> get props => [idUser, id, texto];
}


