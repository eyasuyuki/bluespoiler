import 'package:flutter_test/flutter_test.dart';
import 'package:bluespoiler/data/data.dart';

void main() {
  test('Test Sentence', () => testSentence());
  test('Test Spoiler', () => testSpoiler());
}

void testSentence() {
  Sentence s1 = Sentence();
  expect(s1.text, isEmpty);
  expect(s1.isSecret, isFalse);
  expect(s1.fill(0x20), isEmpty);

  Sentence s2 = Sentence(text: 'あいうえお');
  expect(s2.text, equals('あいうえお'));
  expect(s2.fill(0x20), equals('あいうえお'));
  
  Sentence s3 = Sentence(text: 'あいうえお', isSecret: true);
  expect(s3.fill(0x2a), equals('*****'));
}

void testSpoiler() {
  Spoiler s1 = Spoiler(input: 'あいうえおかきく[け[こ]さ]し]す]せそ');
  String alt = s1.alt.map((e) => e.text).join('');
  expect(alt, equals('あいうえおかきくけこさし]す]せそ'));
  String tweet = s1.alt.map((e) => e.fill('○'.runes.first)).join('');
  expect(tweet, equals('あいうえおかきく○○○し]す]せそ'));

  s1.setInput('あいうえ[お[か[き]くけこさしす]せそ');
  tweet = s1.alt.map((e) => e.fill('○'.runes.first)).join('');
  expect(tweet, equals('あいうえ[お○○○○○○○○せそ'));

  s1.setInput('あいうえおかきく[け[こ]さ]し]す]せそた[ちつ]てと');
  alt = s1.alt.map((e) => e.text).join('');
  tweet = s1.alt.map((e) => e.fill('○'.runes.first)).join('');
  expect(tweet, equals('あいうえおかきく○○○し]す]せそた○○てと'));
}