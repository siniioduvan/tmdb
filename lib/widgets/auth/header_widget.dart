import 'package:flutter/material.dart';
import 'package:tmdb/widgets/auth/form_widget.dart';
import '../../constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const FormWidget(),
          const SizedBox(height: 25,),
          Text('Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
              style: textStyle),
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(color),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 5)),
                textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700))),
            onPressed: () {},
            child: const Text('Регистрация'),
          ),
          const SizedBox(height: 20),
          Text('Если вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь чтобы получить письмо повторно.',
              style: textStyle),
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(color),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 5)),
                textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700))),
            onPressed: () {},
            child: const Text('Получить письмо'),
          ),
        ],
      ),
    );
  }
}