
import 'package:flutter/cupertino.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../model/article.dart';

class LoginScreen extends StatelessWidget {
  final Article article;
  const LoginScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        messages: LoginMessages(
          loginButton: AppLocalizations.of(context)!.post_button_text,
        ),
        onLogin: (data) {
          print(data.name);
          print(data.password);
          // test
          context.pop();
          return null;
        },
        hideForgotPasswordButton: true,
        onRecoverPassword: (_) => null,
    );
  }
}