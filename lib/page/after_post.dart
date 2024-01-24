
import 'package:bluespoiler/model/post_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AfterPost extends StatelessWidget {
  const AfterPost({super.key, required this.title, required this.postResult});

  final String title;
  final PostResult postResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.post_success_text),
                TextButton(
                  onPressed: () => launchUrlString(postResult.url),
                  child: Text(postResult.url),
                ),
                const Padding(padding: EdgeInsets.all(7.0)),
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: Text(AppLocalizations.of(context)!.spoil_again_text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
