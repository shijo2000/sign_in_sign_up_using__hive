import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/pages/loginpage.dart';

class HomePage extends StatelessWidget {
  String name;


  HomePage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('Welcome $name') ,
        actions: [IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(phonenumberr: '', passwordd: '', name: name),
            ),
          );
        }, icon: Icon(Icons.logout))],
      ),
    );
  }

}
