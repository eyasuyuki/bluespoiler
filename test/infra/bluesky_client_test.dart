
import 'dart:io';
import 'package:bluesky/bluesky.dart';
import 'package:bluespoiler/data/data.dart';
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

  test('test extractUrl and createFacets', () {
    final input1 = 'あああ https://hoge.com/fuga いいい http://example.com/bbb/ccc?ddd=fff&ggg=123 ううう';
    List<Region> urls = extractUrl(input1);
    expect(urls, isNotNull);
    List<Facet> facets = createFacets(input1, urls);
    expect(facets, isNotEmpty);
    expect(
        facets,
        [
          Facet(
            index: ByteSlice(byteStart: 10, byteEnd: 31),
            features: [
              FacetFeature.link(
                  data: FacetLink(
                    uri: 'https://hoge.com/fuga',
                  ),
              ),
            ].toList(),
          ),
          Facet(
              index: ByteSlice(byteStart: 42, byteEnd: 84),
              features: [
                FacetFeature.link(
                    data: FacetLink(
                        uri: 'http://example.com/bbb/ccc?ddd=fff&ggg=123'),
                ),
              ].toList(),
          ),
        ].toList(),
    );

    final input2 = 'あああああああああああいいいいいいいいいいいうううううううううう';
    urls = extractUrl(input2);
    expect(urls, isEmpty);
    facets = createFacets(input2, urls);
    expect(facets, isEmpty);
  });
}
