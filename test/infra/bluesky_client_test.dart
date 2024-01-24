
import 'dart:io';
import 'package:bluespoiler/infra/bluesky_client.dart';
import 'package:bluespoiler/model/article.dart';
import 'package:bluespoiler/model/post_result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// please create <project_root>.env file.
// please add environment variable BLUESKY_IDENTIFIER, BLUESKY_PASSWORD to .env file
void main() async {
  await dotenv.load(fileName: '.env');
  final id = dotenv.get('BLUESKY_IDENTIFIER');
  final password = dotenv.get('BLUESKY_PASSWORD');

  test('test testLogin', () async {
    final container = ProviderContainer();
    // test loading
    expect(
        container.read(testLoginProvider.call(email: id, password: password)),
        const AsyncValue<bool>.loading()
    );
    // test success
    expect(
      await container.read(testLoginProvider.call(email: id, password: password).future),
      true
    );
    // test fail
    expect(
      await container.read(testLoginProvider.call(email: 'email', password: 'password').future),
      false
    );
  });

  test('test postArticle', () async {
    final container = ProviderContainer();
    // image data
    final file = File('assets/test.jpg');
    final img = await file.readAsBytes();
    // test loading
    Article article = Article(id: id, password: password, body: '画像投稿テスト', alt: 'テストの文字列', image: img);

    // test loading
    expect(
        container.read(postArticleProvider.call(article: article)),
        const AsyncValue<PostResult>.loading()
    );
    // test post
    final result = await container.read(postArticleProvider.call(article: article).future);
    expect(result, isNotNull);
    expect(result.status, equals('ok'));
    expect(result.url, isNotNull);
  });
}