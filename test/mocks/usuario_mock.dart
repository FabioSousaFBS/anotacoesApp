import 'package:anotacoesapp/features/login/data/models/usuario_model.dart';
import 'package:anotacoesapp/features/login/domain/entities/usuario_entity.dart';

const listUsuarioMock = """ 
[
  {
    "name": "Fabio",
    "password": "password1",
    "id": "1"
  },
  {
    "name": "Maria",
    "password": "password2",
    "id": "2"
  },
  {
    "name": "Joao",
    "password": "password3",
    "id": "3"
  },
  {
    "name": "Leticia",
    "password": "password4",
    "id": "4"
  },
  {
    "name": "Luiz",
    "password": "password5",
    "id": "5"
  },
  {
    "name": "Matheus",
    "password": "password6",
    "id": "6"
  },
  {
    "name": "Alessandra",
    "password": "password7",
    "id": "7"
  },
  {
    "name": "Brenda",
    "password": "password8",
    "id": "8"
  },
  {
    "name": "Nelson",
    "password": "password9",
    "id": "9"
  },
  {
    "name": "Bethania",
    "password": "password10",
    "id": "10"
  }
]

""";


const usuarioMock = """ 
  {
    "name": "Fabio",
    "password": "password1",
    "id": "1"
  }
""";


List<UsuarioModel> tListaUsuariosModel = [
  UsuarioModel(
    id: "1",
    name: "Fabio",
    password: "password1",
  ),
  UsuarioModel(
    id: "2",
    name: "Maria",
    password: "password2",
  ),
  UsuarioModel(
    id: "3",
    name: "Joao",
    password: "password3",
  ),
  UsuarioModel(
    id: "4",
    name: "Leticia",
    password: "password4",
  ),
  UsuarioModel(
    id: "5",
    name: "Luiz",
    password: "password5",
  ),
  UsuarioModel(
    id: "6",
    name: "Matheus",
    password: "password6",
  ),
  UsuarioModel(
    id: "7",
    name: "Alessandra",
    password: "password7",
  ),
  UsuarioModel(
    id: "8",
    name: "Brenda",
    password: "password8",
  ),
  UsuarioModel(
    id: "9",
    name: "Nelson",
    password: "password9",
  ),
  UsuarioModel(
    id: "10",
    name: "Bethania",
    password: "password10",
  )
];


List<UsuarioEntity> tListaUsuariosEntity = [
  UsuarioEntity(
    id: "1",
    name: "Fabio",
    password: "password1",
  ),
  UsuarioEntity(
    id: "2",
    name: "Maria",
    password: "password2",
  ),
  UsuarioEntity(
    id: "3",
    name: "Joao",
    password: "password3",
  ),
  UsuarioEntity(
    id: "4",
    name: "Leticia",
    password: "password4",
  ),
  UsuarioEntity(
    id: "5",
    name: "Luiz",
    password: "password5",
  ),
  UsuarioEntity(
    id: "6",
    name: "Matheus",
    password: "password6",
  ),
  UsuarioEntity(
    id: "7",
    name: "Alessandra",
    password: "password7",
  ),
  UsuarioEntity(
    id: "8",
    name: "Brenda",
    password: "password8",
  ),
  UsuarioEntity(
    id: "9",
    name: "Nelson",
    password: "password9",
  ),
  UsuarioEntity(
    id: "10",
    name: "Bethania",
    password: "password10",
  )
];