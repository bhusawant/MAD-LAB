import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _usernameError;
  String? _passwordError;

  void _login(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // Implement your login logic here
      // For demonstration purposes, let's just print the username and password
      print('Email: $username');
      print('Password: $password');

      // Clear the text fields after successful login
      _usernameController.clear();
      _passwordController.clear();

      // Reset error messages
      setState(() {
        _usernameError = null;
        _passwordError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _usernameError,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _usernameError = null;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passwordError,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9+_.-]+$').hasMatch(value)) {
                    return 'Enter a valid Password';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _passwordError = null;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setState(VoidCallback fn) {}
}
