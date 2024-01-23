
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bluesky/bluesky.dart' as bsky;

import '../model/article.dart';
import '../model/post_result.dart';

part 'bluesky_client.g.dart';

@riverpod
Future<bool> testLogin(TestLoginRef ref, {required String email, required String password}) async {
  try {
    final session = await bsky.createSession(
        identifier: email,
        password: password
    );
    switch (session.status.code) {
      case 200:
        return true;
      case 204:
        return true;
      default:
        return false;
    }
  } catch (e) {
    return false;
  }
}

@riverpod
Future<PostResult> postArticle(PostArticleRef ref, {required Article article}) async {
  try {
    final session = await bsky.createSession(identifier: article.id, password: article.password);
    final bluesky = bsky.Bluesky.fromSession(session.data);
    final uploaded = await bluesky.repo.uploadBlob(article.image!);
    final post = await bluesky.feed.post(
      text: article.body,
      embed: bsky.Embed.images(
          data: bsky.EmbedImages(
            images: [
              bsky.Image(
                alt: article.alt,
                image: uploaded.data.blob,
              ),
            ],
          )),
    );
    return PostResult(
        url: post.data.uri.toString(),
        status: post.status.name,
    );
  } catch (e) {
    rethrow;
  }
}
