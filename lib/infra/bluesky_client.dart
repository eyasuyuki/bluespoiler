import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bluesky/bluesky.dart' as bsky;

import '../data/data.dart';
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
      languageTags: [
        article.lang,
      ],
      embed: bsky.Embed.images(
          data: bsky.EmbedImages(
            images: [
              bsky.Image(
                alt: article.alt,
                image: uploaded.data.blob,
              ),
            ],
          )),
      facets: createFacets(article.body, extractUrl(article.body), extractHashtag(article.body)),
    );
    final articleId = post.data.uri.href.split('/').last;
    final url = Uri(
      scheme: 'https',
      host: 'bsky.app',
      pathSegments: <String>[
        'profile',
        session.data.handle,
        'post',
        articleId,
      ],
    );
    return PostResult(
        url: url.toString(),
        status: post.status.name,
    );
  } catch (e) {
    rethrow;
  }
}

List<Region> extractUrl(String input) {
  final regexp = RegExp(r'https?://[^\s]*');
  final matched = regexp.allMatches(input);
  return matched.map((e) => Region(start: e.start, end: e.end)).toList();
}

List<Region> extractHashtag(String input) {
  final regexp = RegExp(r'(#[^ ]+) ?');
  final matched = regexp.allMatches(input);
  return matched.map((e) => Region(start: e.start, end: e.end)).toList();
}

List<bsky.Facet> createFacets(String input, List<Region> urls, List<Region> hashtags) {
  urls = toByteIndices(input, urls);
  List<bsky.Facet> urlFacets = urls.map((e) => bsky.Facet(
    index: bsky.ByteSlice(
        byteStart: e.byteStart,
        byteEnd: e.byteEnd,
    ),
    features: [
      bsky.FacetFeature.link(
          data: bsky.FacetLink(
              uri: input.substring(e.start, e.end),
          ),
      ),
    ],
  )).toList();

  // hashtags
  hashtags = toByteIndices(input, hashtags);
  List<bsky.Facet> hashtagFacets = hashtags.map((e) => bsky.Facet(
    index: bsky.ByteSlice(
      byteStart: e.byteStart,
      byteEnd: e.byteEnd,
    ),
    features: [
      bsky.FacetFeature.tag(
        data: bsky.FacetTag(
          tag: input.substring(e.start, e.end),
        ),
      ),
    ]
  )).toList();

  return urlFacets + hashtagFacets;
}

List<Region> toByteIndices(String input, List<Region> pairs) {
  int byteIndex = 0;
  int prevBytes = 0;
  for (int i = 0; i < input.length; i++) {
    byteIndex += prevBytes;
    for (var p in pairs) {
      if (i == p.start) {
        p.byteStart = byteIndex;
      } else if (i == p.end) {
        p.byteEnd = byteIndex;
      }
    }
    prevBytes = utf8.encode(input[i]).length;
  }
  return pairs;
}
