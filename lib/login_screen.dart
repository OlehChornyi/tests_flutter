import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              key: const ValueKey('email_id'),
            ),
            TextFormField(
              controller: _passwordController,
              key: const ValueKey('password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
