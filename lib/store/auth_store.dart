import 'package:appwrite_flutter_auth/models/user.dart';
import 'package:appwrite_flutter_auth/repository/auth_repository.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  late AuthRepository authRepository = AuthRepository();
  @observable
  bool loading = false;

  @observable
  bool isAuthenticating = false;

  @observable
  late User user;

  @observable
  bool isAuthenticated = false;

  @action
  Future register(User user) async {
    loading = true;
    await authRepository.register(user);
    loading = false;
  }

  @action
  Future login(User user) async {
    try {
      loading = true;
      await authRepository.login(user);
      loading = false;
      isAuthenticated = true;
    } catch (e) {
      print(e);
      isAuthenticated = false;
      loading = false;
    }
  }

  @action
  Future getUser(User user) async {
    try {
      isAuthenticating = true;
      User loggedUser = await authRepository.getLoggedInUser();
      user = loggedUser;
      isAuthenticating = false;
      isAuthenticated = true;
    } catch (e) {
      isAuthenticated = false;
      isAuthenticating = false;
      print(e);
    }
  }
}
