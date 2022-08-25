import 'package:flutter/material.dart';
import 'package:tmdb/widgets/auth/header_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Login to your account')),
        ),
        body: ListView(
          children: const [HeaderWidget()],
        ),
    );
  }
}



