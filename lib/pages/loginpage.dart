

import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/pages/Homepage.dart';
import 'package:sign_in_sign_up/pages/signUpPage.dart';

class LoginPage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();

  final TextEditingController _phonenumber = TextEditingController();

  final TextEditingController _password = TextEditingController();

  String phonenumberr,passwordd,name;

  LoginPage({required this.phonenumberr, required this.passwordd,required this.name });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: OverflowBar(
                overflowSpacing: 20,
                children: [
                  TextFormField(
                    controller: _phonenumber,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Phone Number is empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                  TextFormField(
                    controller: _password,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Password is empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Button pressed");
                        if (_formkey.currentState!.validate()) {
                          print("Form is valid");
                          if ((_password.text == passwordd) && (_phonenumber.text == phonenumberr)) {
                            print("Password and phone number match");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(name: name,),
                              ),
                            );
                          } else {
                            print("Password or phone number do not match");
                          }
                        } else {
                          print("Form is not valid");
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Text('Sign up'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );

  }
}