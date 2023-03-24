import 'package:flutter/material.dart';
import 'api.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await Api.signIn(email, password);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        print("ok");
      } catch (e) {
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Adresse email",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mot de passe",
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _signIn,
              child: Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
