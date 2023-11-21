// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  Computed<bool>? _$dadosValidadosComputed;

  @override
  bool get dadosValidados =>
      (_$dadosValidadosComputed ??= Computed<bool>(() => super.dadosValidados,
              name: 'LoginControllerBase.dadosValidados'))
          .value;

  late final _$userAtom =
      Atom(name: 'LoginControllerBase.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: 'LoginControllerBase.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$usuarioLogadoAtom =
      Atom(name: 'LoginControllerBase.usuarioLogado', context: context);

  @override
  bool get usuarioLogado {
    _$usuarioLogadoAtom.reportRead();
    return super.usuarioLogado;
  }

  @override
  set usuarioLogado(bool value) {
    _$usuarioLogadoAtom.reportWrite(value, super.usuarioLogado, () {
      super.usuarioLogado = value;
    });
  }

  late final _$carregandoAtom =
      Atom(name: 'LoginControllerBase.carregando', context: context);

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  late final _$mensagemErroAtom =
      Atom(name: 'LoginControllerBase.mensagemErro', context: context);

  @override
  String get mensagemErro {
    _$mensagemErroAtom.reportRead();
    return super.mensagemErro;
  }

  @override
  set mensagemErro(String value) {
    _$mensagemErroAtom.reportWrite(value, super.mensagemErro, () {
      super.mensagemErro = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: 'LoginControllerBase.usuario', context: context);

  @override
  UsuarioEntity get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UsuarioEntity value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$logarAsyncAction =
      AsyncAction('LoginControllerBase.logar', context: context);

  @override
  Future<void> logar() {
    return _$logarAsyncAction.run(() => super.logar());
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void setUser(dynamic valor) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setUser');
    try {
      return super.setUser(valor);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(dynamic valor) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setSenha');
    try {
      return super.setSenha(valor);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
senha: ${senha},
usuarioLogado: ${usuarioLogado},
carregando: ${carregando},
mensagemErro: ${mensagemErro},
usuario: ${usuario},
dadosValidados: ${dadosValidados}
    ''';
  }
}
