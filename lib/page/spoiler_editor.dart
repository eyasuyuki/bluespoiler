import 'dart:typed_data';

import 'package:bluespoiler/infra/bluesky_client.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:bluespoiler/data/data.dart';

import '../model/article.dart';

class SpoilerEditor extends HookConsumerWidget {
  const SpoilerEditor({super.key, required this.title, this.clearAll = false});

  final String title;
  final bool clearAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // spoiler
    final Spoiler spoiler = Spoiler();
    // hidden char
    final hiddenChar = AppLocalizations.of(context)!.hidden_char.runes.first;
    // ellipsis
    final ellipsis = AppLocalizations.of(context)!.ellipsis;
    // useState
    // image bytes
    final imageBytes = useState<Uint8List?>(null);
    // text edit
    final filledText = useState<String>('');
    // text editing controllers
    // input controller
    final inputController = useTextEditingController();
    inputController.addListener(() {
      spoiler.setInput(inputController.text);
      filledText.value = spoiler.postText(hiddenChar, AppLocalizations.of(context)!.ellipsis);
    });
    // email controller
    final emailController = useTextEditingController();
    // password controller
    final passwordController = useTextEditingController();
    // focus node
    final focusNode = useFocusNode();

    // use effect
    useEffect(() {
      if (clearAll) {
        inputController.clear();
        imageBytes.value = null;
        emailController.clear();
        passwordController.clear();
      }
      return null;
    }, [clearAll]);

    void insertTextAtCursorPosition(String text) {
      final currentText = inputController.text;
      final cursorPosition = inputController.selection.baseOffset;

      // 現在のカーソル位置に文字を挿入
      final newText = currentText.substring(0, cursorPosition) + text + currentText.substring(cursorPosition);

      // テキストを更新
      inputController.text = newText;

      // カーソル位置を更新
      inputController.selection = TextSelection.collapsed(offset: cursorPosition + text.length);

      // ボタンが押された後にTextFieldにフォーカスをセット
      FocusScope.of(context).requestFocus(focusNode);
    }

    Future<void> pickImage() async {
      const maxImageSize = 999997;
      try {
        Uint8List? uint8list = await ImagePickerWeb.getImageAsBytes();
        if (uint8list!.lengthInBytes > maxImageSize) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.image_size_text),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else {
          imageBytes.value = uint8list;
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          //body: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.description,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(AppLocalizations.of(context)!.help),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLength: 1000,
                maxLines: 10,
                autofocus: true,
                controller: inputController,
                focusNode: focusNode,
                decoration: InputDecoration(counterText: '', hintText: AppLocalizations.of(context)!.input_hint_text, border: const OutlineInputBorder()),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        insertTextAtCursorPosition('[');
                      },
                      child: Text(AppLocalizations.of(context)!.open_bracket_input_text)),
                  ElevatedButton(
                      onPressed: () {
                        insertTextAtCursorPosition(']');
                      },
                      child: Text(AppLocalizations.of(context)!.close_bracket_input_text))
                ],
              ),
              Text(
                filledText.value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              imageBytes.value != null
                  ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.memory(
                        imageBytes.value!,
                        width: 200,
                        height: 200,
                      ),
                      CloseButton(onPressed: () {
                        imageBytes.value = null;
                      })
                    ])
                  : ElevatedButton(
                      onPressed: () async {
                        await pickImage();
                      },
                      child: Text(AppLocalizations.of(context)!.image_button_text)),
              // form
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: AutofillGroup(
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.email_input_label,
                        ),
                        validator: (value) {
                          if ((value == null) || !EmailValidator.validate(value)) {
                            return AppLocalizations.of(context)!.email_error_text;
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                      // Password
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.password_input_label,
                        ),
                        controller: passwordController,
                      ),
                      // test connection
                      TextButton(
                          onPressed: () async {
                            await ref.read(testLoginProvider.call(email: emailController.text, password: passwordController.text).future)
                                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.login_success_text)))
                                : ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(backgroundColor: Colors.redAccent, content: Text(AppLocalizations.of(context)!.login_failed_text)));
                          },
                          child: Text(AppLocalizations.of(context)!.verify_button_text),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(7.0)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (inputController.text.isEmpty || imageBytes.value == null)
                      ? null
                      : () async {
                          spoiler.setInput(inputController.text);
                          try {
                            final result = await ref.read(postArticleProvider
                                .call(
                                    article: Article(
                                  id: emailController.text,
                                  password: passwordController.text,
                                  body: spoiler.postText(hiddenChar, ellipsis),
                                  alt: spoiler.alt.map((e) => e.text).join(''),
                                  image: imageBytes.value,
                                ))
                                .future);
                            //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.post_success_text)));
                            context.go('/after_post', extra: result);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.redAccent, content: Text(AppLocalizations.of(context)!.post_failed_text + ': ' + e.toString())));
                          }
                        },
                  child: Text(AppLocalizations.of(context)!.post_button_text),
                ),
              ),
            ],
          ),
        ), // end of Container
      ),
    );
  }
}
