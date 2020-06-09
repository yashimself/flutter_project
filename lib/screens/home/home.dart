import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:coffee_app/screens/home/brew_list.dart';

class Home extends StatelessWidget {

final AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('BrewCrew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              onPressed: () async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
              )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}