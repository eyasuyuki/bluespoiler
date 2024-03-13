
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_storage.g.dart';

@riverpod
Future<void> savePassword(SavePasswordRef ref, {required String id, required String password}) async {
  final storage = FlutterSecureStorage();
  await storage.write(key: id, value: password);
}

@riverpod
Future<String?> loadPassword(LoadPasswordRef ref, {required String id}) async {
  final storage = FlutterSecureStorage();
  return await storage.read(key: id);
}