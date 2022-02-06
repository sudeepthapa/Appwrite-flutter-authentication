import 'package:appwrite_flutter_auth/pages/auth/login.dart';
import 'package:appwrite_flutter_auth/pages/main/home_page.dart';
import 'package:appwrite_flutter_auth/pages/main/splash_screen.dart';
import 'package:appwrite_flutter_auth/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => AuthStore()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = AuthStore();

    Widget buildHome() {
      if (_authStore.isAuthenticating) {
        return SplashScreen();
      } else if (!_authStore.isAuthenticated) {
        return Login();
      } else {
        return HomePage();
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildHome(),
    );
  }
}
