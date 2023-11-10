import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebase = FirebaseAuth.instance;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredConfirmedPassword = '';
  var _enteredUsername = '';
  var _enteredFullName = '';
  bool _isLogin = true;

  submit() {
    print("current form: ${_isLogin ? "login" : "register"}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.health_and_safety_outlined,
                        size: 80,
                        color: Colors.purple,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            if (_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Email Adress",
                                  icon: Icon(
                                    Icons.alternate_email,
                                  ),
                                ),
                                initialValue: _enteredEmail,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@')) {
                                    return "Please enter a correct email address";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredEmail = newValue!;
                                },
                              ),
                            if (_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Password",
                                  icon: Icon(Icons.password),
                                ),
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                initialValue: _enteredPassword,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 6) {
                                    return 'Please enter at least 6 character password';
                                  } else if (value.trim().length > 30) {
                                    return 'Please enter maximum of 30 character password';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredPassword = newValue!;
                                },
                              ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: "full Name",
                                ),
                                initialValue: _enteredFullName,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 3) {
                                    return 'Please enter at least 3 character full name.';
                                  } else if (value.trim().length > 25) {
                                    return 'Please enter maximum of 25 character full name.';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredFullName = newValue!;
                                },
                              ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: "Username",
                                ),
                                initialValue: _enteredUsername,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 3) {
                                    return 'Please enter at least 3 character username.';
                                  } else if (value.trim().length > 25) {
                                    return 'Please enter maximum of 25 character username.';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredUsername = newValue!;
                                },
                              ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Email Adress",
                                  icon: Icon(
                                    Icons.alternate_email,
                                  ),
                                ),
                                initialValue: _enteredEmail,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@')) {
                                    return "Please enter a correct email address";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredEmail = newValue!;
                                },
                              ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Password",
                                  icon: Icon(Icons.password),
                                ),
                                initialValue: _enteredPassword,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 6) {
                                    return 'Please enter at least 6 character password';
                                  } else if (value.trim().length > 30) {
                                    return 'Please enter maximum of 30 character password';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredPassword = newValue!;
                                },
                              ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Confirm Password",
                                  icon: Icon(Icons.password),
                                ),
                                initialValue: _enteredConfirmedPassword,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 6) {
                                    return 'Please enter at least 6 character password';
                                  } else if (value.trim().length > 30) {
                                    return 'Please enter maximum of 30 character password';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredConfirmedPassword = newValue!;
                                },
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: _isLogin
                                      ? const Text("Don't have an account")
                                      : const Text("Already have an account"),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    submit();
                                  },
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0)),
                                  child: _isLogin
                                      ? const Text("Sign in")
                                      : const Text("Sign up"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
