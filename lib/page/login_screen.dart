
import 'package:flutter/cupertino.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bluesky/bluesky.dart' as bsky;


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
        onLogin: (data) async {
          final session = await bsky.createSession(
              identifier: data.name,
              password: data.password);
          // TODO save id/password
          final bluesky = bsky.Bluesky.fromSession(session.data);
          // embed
          //final blob = bsky.Blob(mimeType: mimeType, size: size, ref: ref)
          //final image = bsky.Image(alt: article.alt, image: blob);

          // test
          context.pop();
          return null;
        },
        hideForgotPasswordButton: true,
        onRecoverPassword: (_) => null,
    );
  }
}