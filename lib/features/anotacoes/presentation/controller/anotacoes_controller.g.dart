// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anotacoes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnotacoesController on AnotacoesControllerBase, Store {
  late final _$carregandoAtom =
      Atom(name: 'AnotacoesControllerBase.carregando', context: context);

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

  late final _$carregandoAnotacaoAtom = Atom(
      name: 'AnotacoesControllerBase.carregandoAnotacao', context: context);

  @override
  bool get carregandoAnotacao {
    _$carregandoAnotacaoAtom.reportRead();
    return super.carregandoAnotacao;
  }

  @override
  set carregandoAnotacao(bool value) {
    _$carregandoAnotacaoAtom.reportWrite(value, super.carregandoAnotacao, () {
      super.carregandoAnotacao = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'AnotacoesControllerBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_listaAnotacoesFutureAtom = Atom(
      name: 'AnotacoesControllerBase._listaAnotacoesFuture', context: context);

  @override
  ObservableFuture<List<AnotacoesEntity>>? get _listaAnotacoesFuture {
    _$_listaAnotacoesFutureAtom.reportRead();
    return super._listaAnotacoesFuture;
  }

  @override
  set _listaAnotacoesFuture(ObservableFuture<List<AnotacoesEntity>>? value) {
    _$_listaAnotacoesFutureAtom.reportWrite(value, super._listaAnotacoesFuture,
        () {
      super._listaAnotacoesFuture = value;
    });
  }

  late final _$indexSelecionadoAtom =
      Atom(name: 'AnotacoesControllerBase.indexSelecionado', context: context);

  @override
  int get indexSelecionado {
    _$indexSelecionadoAtom.reportRead();
    return super.indexSelecionado;
  }

  @override
  set indexSelecionado(int value) {
    _$indexSelecionadoAtom.reportWrite(value, super.indexSelecionado, () {
      super.indexSelecionado = value;
    });
  }

  late final _$salvarAnotacoesAsyncAction =
      AsyncAction('AnotacoesControllerBase.salvarAnotacoes', context: context);

  @override
  Future<void> salvarAnotacoes(AnotacoesEntity anotacao) {
    return _$salvarAnotacoesAsyncAction
        .run(() => super.salvarAnotacoes(anotacao));
  }

  late final _$removerAnotacoesAsyncAction =
      AsyncAction('AnotacoesControllerBase.removerAnotacoes', context: context);

  @override
  Future<void> removerAnotacoes(AnotacoesEntity anotacao) {
    return _$removerAnotacoesAsyncAction
        .run(() => super.removerAnotacoes(anotacao));
  }

  late final _$AnotacoesControllerBaseActionController =
      ActionController(name: 'AnotacoesControllerBase', context: context);

  @override
  dynamic setAnotacaoSelecionada(int index) {
    final _$actionInfo = _$AnotacoesControllerBaseActionController.startAction(
        name: 'AnotacoesControllerBase.setAnotacaoSelecionada');
    try {
      return super.setAnotacaoSelecionada(index);
    } finally {
      _$AnotacoesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
carregandoAnotacao: ${carregandoAnotacao},
errorMessage: ${errorMessage},
indexSelecionado: ${indexSelecionado}
    ''';
  }
}
