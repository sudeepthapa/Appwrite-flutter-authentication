// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$loadingAtom = Atom(name: '_AuthStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isAuthenticatingAtom = Atom(name: '_AuthStoreBase.isAuthenticating');

  @override
  bool get isAuthenticating {
    _$isAuthenticatingAtom.reportRead();
    return super.isAuthenticating;
  }

  @override
  set isAuthenticating(bool value) {
    _$isAuthenticatingAtom.reportWrite(value, super.isAuthenticating, () {
      super.isAuthenticating = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isAuthenticatedAtom = Atom(name: '_AuthStoreBase.isAuthenticated');

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_AuthStoreBase.register');

  @override
  Future<dynamic> register(User user) {
    return _$registerAsyncAction.run(() => super.register(user));
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<dynamic> login(User user) {
    return _$loginAsyncAction.run(() => super.login(user));
  }

  final _$getUserAsyncAction = AsyncAction('_AuthStoreBase.getUser');

  @override
  Future<dynamic> getUser(User user) {
    return _$getUserAsyncAction.run(() => super.getUser(user));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isAuthenticating: ${isAuthenticating},
user: ${user},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
