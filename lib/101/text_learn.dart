import 'package:flutter/material.dart';

class TextLearn extends StatelessWidget {
  TextLearn({super.key, this.name});
  final String username = 'Ömer';
  final String? name;
  final ProjectKeys keys = ProjectKeys();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome $username ${username.length}',
              maxLines: 2,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.right,
              textScaleFactor: 1,
              style: const TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
                wordSpacing: 2,
                letterSpacing: 2,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                //height: 24,
              ),
            ),
            Text('hello $username ${username.length}',
                maxLines: 2,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.right,
                textScaleFactor: 1,
                style: ProjectStayles.welcomeStyle),
            Text('hello $username ${username.length}',
                maxLines: 2,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.right,
                textScaleFactor: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: ProjectColors.welcomeColor)),
            Text(name ?? ''),

            //En dogru kullanim
            Text(keys.welcome,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: ProjectColors.welcome2Color)),
          ],
        ),
      ),
    );
  }
}

class ProjectStayles {
  static TextStyle welcomeStyle = const TextStyle(
    color: Colors.red,
    decoration: TextDecoration.underline,
    wordSpacing: 2,
    letterSpacing: 2,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    //height: 24,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
  static Color welcome2Color = Colors.yellow;
}

class ProjectKeys {
  final String welcome = 'welcome';
}
