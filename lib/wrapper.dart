import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellerapp/screens/home.dart';
import 'package:travellerapp/screens/login.dart';
import 'package:travellerapp/services/auth.dart';


import 'models/user.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream:authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot){
          if (snapshot.connectionState == ConnectionState.active){
            final User? user = snapshot.data;
            return user == null ? Login() : Home();
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }
    }
    );
  }
}