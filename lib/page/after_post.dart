
import 'package:bluespoiler/model/post_result.dart';
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
        title: SelectableText(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              children: [
                SelectableText(AppLocalizations.of(context)!.post_success_text),
                TextButton(
                  onPressed: () => launchUrlString(postResult.url),
                  child: Text(postResult.url),
                ),
                const Padding(padding: EdgeInsets.all(7.0)),
                ElevatedButton(
                  onPressed: () => context.go('/', extra: true),
                  child: Text(AppLocalizations.of(context)!.spoil_again_text),
                ),
                const Padding(padding: EdgeInsets.all(7.0)),
                Row(
                  children: [
                    SelectableText(AppLocalizations.of(context)!.copyright_text),
                    TextButton(
                      onPressed: () => launchUrlString(AppLocalizations.of(context)!.sponsor_url),
                      child: Text(AppLocalizations.of(context)!.sponsor_text),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
