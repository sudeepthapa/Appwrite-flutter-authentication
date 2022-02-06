import 'package:appwrite_flutter_auth/models/user.dart';
import 'package:appwrite_flutter_auth/pages/auth/login.dart';
import 'package:appwrite_flutter_auth/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _authStore = AuthStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    User user = User(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                    await _authStore.register(user);
                    nameController.text = '';
                    emailController.text = '';
                    passwordController.text = '';
                  },
                  child: const Text('Register'),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Already registered?'),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: Observer(builder: (_) {
                        return Text(
                          _authStore.loading ? 'Loading' : 'Login',
                          style: const TextStyle(color: Colors.blue),
                        );
                      }),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
