import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'todo_screen.dart';
import '../services/auth/auth_services.dart';
import 'signIn_screen.dart';


class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthServices();

    return StreamBuilder<User?> (
      stream: auth.authStateChanges,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text('Gagal memuat status login'),
            ),
          );
        } else if(snapshot.hasData){
          return TodoScreen();
        } else{
          return const SignInScreen();
        }
      },
    );
  }
}