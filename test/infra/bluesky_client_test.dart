
import 'package:bluespoiler/infra/bluesky_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// please set environment variable BLUESKY_IDENTIFIER, BLUESKY_PASSWORD

void main() async {
  await dotenv.load(fileName: '.env');
  final id = dotenv.get('BLUESKY_IDENTIFIER');
  final password = dotenv.get('BLUESKY_PASSWORD');

  test('test testLogin', () async {
    final container = ProviderContainer();
    expect(
        container.read(testLoginProvider.call(email: id, password: password)),
        const AsyncValue<bool>.loading()
    );
    expect(
      await container.read(testLoginProvider.call(email: id, password: password).future),
      true
    );

  });
}