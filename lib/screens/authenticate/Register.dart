import 'package:coffee_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/services/auth.dart';
import 'package:coffee_app/shared/constants.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;
 //text field state

  String email='';
  String password='';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: [
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            },
             icon: Icon(Icons.person),
              label: Text('Sign In'),
              )
        ],
      ),


      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val){
                setState(() {
                  email=val;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              validator: (val) => val.length < 6 ? 'Enter a password with more than 6 characters' : null,
              onChanged: (val){
                setState(() {
                  password=val;
                });

              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.brown[50],
              child: Text('Sign up',
              style: TextStyle(
                color: Colors.black54,
              ),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()){
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth.RegisterwithEmailandPass(email, password);
                  if (result == null){
                    setState(() {
                      error= ' Please use valid email and password ';
                      loading = false;
                    });
                  }
                  
                }
              },
                ),
                SizedBox(height: 20.0,),
                Text(error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,

                ),
                ),
            ],
          ),
          )
      ),
    );
  }
}