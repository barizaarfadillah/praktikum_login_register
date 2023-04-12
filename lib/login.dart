import 'package:flutter/material.dart';
import './register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var username = arguments?['username'];
    var password = arguments?['password'];
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
                "LOGIN",
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
                          if (usernameValue.text == username &&
                              passwordValue.text == password) {
                            Navigator.pushNamed(context, '/home',
                                    arguments: {'username': username})
                                .then((value) => {
                                      if (value == true)
                                        {Navigator.of(context).pop()}
                                    });
                          } else if (usernameValue.text.isEmpty ||
                              usernameValue.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              // ignore: prefer_const_constructors
                              SnackBar(
                                content: Text('Username or Password Required'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              // ignore: prefer_const_constructors
                              SnackBar(
                                content: Text('Username or Password Invalid'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: Center(
                            child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dont have a Account?',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
