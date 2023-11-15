import 'package:flutter/material.dart';
import 'home_page.dart'; // Impor halaman utama

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.person, size: 50, color: Colors.white,),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:
                      Colors.red, width: 2.0),
                      borderRadius:
                      BorderRadius.circular(50.0),
                    ),
                    contentPadding:
                    EdgeInsets.only(left: 30.0, top: 20.0,
                        bottom: 20.0 ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.red,
                          width: 2.0),
                      borderRadius:
                      BorderRadius.circular(50.0),
                    ),
                    suffixIcon: Icon(
                        Icons.person,
                        color: Colors.red[400]
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.red)),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    contentPadding:
                    EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.red[400],
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.red)),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(150, 50), // Sesuaikan dengan ukuran yang Anda inginkan.
                ),

                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ListDataPage()),
                    );
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}