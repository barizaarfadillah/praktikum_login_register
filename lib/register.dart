import 'package:flutter/material.dart';
import './login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController usernameValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(100),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orange, Colors.black])),
        child: Card(
          elevation: 15,
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              // ignore: prefer_const_constructors
              child: Text(
                "REGISTER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: [
                  TextField(
                    controller: usernameValue,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordValue,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black,
                      elevation: 10.0,
                      child: ElevatedButton(
                        onPressed: () {
                          final Map<String, dynamic> arguments = {
                            'username': usernameValue.text,
                            'password': passwordValue.text
                          };

                          Navigator.pushNamed(context, '/login',
                              arguments: arguments);
                        },
                        child: Center(
                            child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
