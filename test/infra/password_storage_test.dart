
import 'package:bluespoiler/infra/password_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  setUpAll(() => FlutterSecureStorage.setMockInitialValues({}));
  TestWidgetsFlutterBinding.ensureInitialized();
  test('test save/loadPassword', () async {
    final container = ProviderContainer();
    const id = 'abcxyz';
    const password = 'def1234uvw9876';
    await container.read(savePasswordProvider.call(id: id, password: password).future);
    expect(
      await container.read(loadPasswordProvider.call(id: id).future),
      password,
    );
  });
}