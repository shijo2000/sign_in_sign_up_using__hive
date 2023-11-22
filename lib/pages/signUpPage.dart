import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sign_in_sign_up/main.dart';
import 'package:sign_in_sign_up/pages/loginpage.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwordd = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _namee = TextEditingController();
  final TextEditingController _phonenumberr = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  late Box box1;

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('signupdata');

    getdata();
  }

  void getdata() async {
    if (box1.get("_email") != null) {
      _email.text = box1.get('_email');
    }
    if (box1.get("_passwordd") != null) {
      _passwordd.text = box1.get('_passwordd');
    }
    if (box1.get("_namee") != null) {
      _namee.text = box1.get('_namee');
    }
    if (box1.get("_lastname") != null) {
      _lastname.text = box1.get('_lastname');
    }
    if (box1.get("_phonenumberr") != null) {
      _phonenumberr.text = box1.get('_phonenumberr');
    }
    if (box1.get("_gender") != null) {
      _gender.text = box1.get('_gender');
    }
    if (box1.get("_confirmpassword") != null) {
      _confirmpassword.text = box1.get('_confirmpassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: OverflowBar(
                  overflowSpacing: 20,
                  children: [
                    TextFormField(
                      controller: _namee,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Name is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                    TextFormField(
                      controller: _lastname,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    TextFormField(
                      controller: _email,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Email is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: _phonenumberr,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Phone Number is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Phone Number'),
                    ),
                    TextFormField(
                      controller: _gender,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Gender is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Gender'),
                    ),
                    TextFormField(
                      controller: _passwordd,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Password is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    TextFormField(
                      controller: _confirmpassword,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Password is empty";
                        }
                        return null;
                      },
                      decoration:
                      InputDecoration(labelText: 'Confirm Password'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            signup();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    LoginPage(
                                      phonenumberr: _phonenumberr.text, passwordd: _passwordd.text, name: _namee.text)));
                          }
                        },
                        child: Text('Sign up'),
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
                                  builder: (context) =>
                                      MyApp(

                                      )));
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void signup() {
    box1.put('_email', _email.text);
    box1.put('_passwordd', _passwordd.text);
    box1.put('_namee', _namee.text);
    box1.put('_lastname', _lastname.text);
    box1.put('_phonenumberr', _phonenumberr.text);
    box1.put('_gender', _gender.text);
    box1.put('_confirmpassword', _confirmpassword.text);
  }
}
