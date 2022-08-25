import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

const decoration = InputDecoration(
    border: OutlineInputBorder(),
    isCollapsed: true,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
const color = Color(0xFF01B4E4);

class _FormWidgetState extends State<FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('/mainScreen');
    } else {
      errorText = 'Неверный логин или пароль';
      print('show error');
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        Text(
          'Имя пользователя',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: decoration,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Пароль',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: decoration,
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20)),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700))),
              onPressed: _auth,
              child: const Text('Войти'),
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(color),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20)),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700))),
              onPressed: _resetPassword,
              child: const Text('Забыли пароль?'),
            )
          ],
        )
      ],
    );
  }
}
