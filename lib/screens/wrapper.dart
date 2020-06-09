import 'package:coffee_app/screens/authenticate/authenticate.dart';
import 'package:coffee_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_app/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    //return Authenticate widget
    if(user == null){
      return authenticate();
    }else{
      return Home();
    }

  }
}