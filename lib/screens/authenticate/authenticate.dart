import 'package:coffee_app/screens/authenticate/Register.dart';
import 'package:coffee_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/screens/authenticate/Register.dart';

class authenticate extends StatefulWidget {

  
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {

bool showSignin = true;
void toggleView()
{
  setState(() {
    showSignin = !showSignin;
  });
}

  @override
  Widget build(BuildContext context) {
    if(showSignin)
    {
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
  }
  }
