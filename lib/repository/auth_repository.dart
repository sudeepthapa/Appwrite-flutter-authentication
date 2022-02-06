import 'package:appwrite/appwrite.dart';
import 'package:appwrite_flutter_auth/models/user.dart';

class AuthRepository {
  late Client _client;
  late Account _account;
  late Database _db;
  AuthRepository() {
    _client = _client
        .setEndpoint('https://localhost/v1') // Your Appwrite Endpoint
        .setProject('61fe83a3df30ff969fd3') // Your project ID
        .setSelfSigned(
          status: true,
        );
    _account = Account(_client);
    _db = Database(_client);
  }

  Future register(User user) async {
    return await _account.create(
        userId: 'unique()',
        email: user.email,
        password: user.password!,
        name: user.name!);
  }

  Future login(User user) async {
    return await _account.createSession(
      email: user.email,
      password: user.password!,
    );
  }

  Future<User> getLoggedInUser() async {
    final res = await _account.get();
    return User.fromJson(res.toMap());
  }
}
