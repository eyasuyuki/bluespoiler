import 'dart:typed_data';

import 'package:bluespoiler/controller/spoiler_notifier.dart';
import 'package:bluespoiler/page/spoiler_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'data/data.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('en', ''), Locale('ja', '')],
      title: 'Bluespoiler',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: _Page(title: 'Bluespoiler'),
    );
  }
}

class _Page extends HookWidget {
  _Page({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // style
    final buttonStyle = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    // spoiler
    final Spoiler spoiler = Spoiler();
    // hidden char
    final hiddenChar = AppLocalizations.of(context)!.hidden_char.runes.first;
    // text edit
    final filledText = useState<String>('');
    final inputController = useTextEditingController();
    inputController.addListener(() {
      spoiler.setInput(inputController.text);
      filledText.value = spoiler.postText(hiddenChar, AppLocalizations.of(context)!.ellipsis);
    });
    // focus node
    final focusNode = useFocusNode();
    // image bytes
    final imageBytes = useState<Uint8List?>(null);

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
      try {
        Uint8List? uint8list = await ImagePickerWeb.getImageAsBytes();
        imageBytes.value = uint8list;
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(this.title),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
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
              '${filledText.value}',
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
            Padding(padding: EdgeInsets.all(7.0)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (inputController.text.isEmpty || imageBytes.value == null) ? null : () async {},
                child: Text(AppLocalizations.of(context)!.post_button_text),
              ),
            )
          ],
        ),
      ),
    );
  }
}
