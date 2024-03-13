// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savePasswordHash() => r'592c6e5551abac02f42e1a47bd59629aed1df739';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [savePassword].
@ProviderFor(savePassword)
const savePasswordProvider = SavePasswordFamily();

/// See also [savePassword].
class SavePasswordFamily extends Family<AsyncValue<void>> {
  /// See also [savePassword].
  const SavePasswordFamily();

  /// See also [savePassword].
  SavePasswordProvider call({
    required String id,
    required String password,
  }) {
    return SavePasswordProvider(
      id: id,
      password: password,
    );
  }

  @override
  SavePasswordProvider getProviderOverride(
    covariant SavePasswordProvider provider,
  ) {
    return call(
      id: provider.id,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savePasswordProvider';
}

/// See also [savePassword].
class SavePasswordProvider extends AutoDisposeFutureProvider<void> {
  /// See also [savePassword].
  SavePasswordProvider({
    required String id,
    required String password,
  }) : this._internal(
          (ref) => savePassword(
            ref as SavePasswordRef,
            id: id,
            password: password,
          ),
          from: savePasswordProvider,
          name: r'savePasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savePasswordHash,
          dependencies: SavePasswordFamily._dependencies,
          allTransitiveDependencies:
              SavePasswordFamily._allTransitiveDependencies,
          id: id,
          password: password,
        );

  SavePasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.password,
  }) : super.internal();

  final String id;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(SavePasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavePasswordProvider._internal(
        (ref) => create(ref as SavePasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SavePasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavePasswordProvider &&
        other.id == id &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavePasswordRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `password` of this provider.
  String get password;
}

class _SavePasswordProviderElement
    extends AutoDisposeFutureProviderElement<void> with SavePasswordRef {
  _SavePasswordProviderElement(super.provider);

  @override
  String get id => (origin as SavePasswordProvider).id;
  @override
  String get password => (origin as SavePasswordProvider).password;
}

String _$loadPasswordHash() => r'46c76d04a801fe584f87ffcd4fe13c04ef25b255';

/// See also [loadPassword].
@ProviderFor(loadPassword)
const loadPasswordProvider = LoadPasswordFamily();

/// See also [loadPassword].
class LoadPasswordFamily extends Family<AsyncValue<String?>> {
  /// See also [loadPassword].
  const LoadPasswordFamily();

  /// See also [loadPassword].
  LoadPasswordProvider call({
    required String id,
  }) {
    return LoadPasswordProvider(
      id: id,
    );
  }

  @override
  LoadPasswordProvider getProviderOverride(
    covariant LoadPasswordProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadPasswordProvider';
}

/// See also [loadPassword].
class LoadPasswordProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [loadPassword].
  LoadPasswordProvider({
    required String id,
  }) : this._internal(
          (ref) => loadPassword(
            ref as LoadPasswordRef,
            id: id,
          ),
          from: loadPasswordProvider,
          name: r'loadPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadPasswordHash,
          dependencies: LoadPasswordFamily._dependencies,
          allTransitiveDependencies:
              LoadPasswordFamily._allTransitiveDependencies,
          id: id,
        );

  LoadPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<String?> Function(LoadPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadPasswordProvider._internal(
        (ref) => create(ref as LoadPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _LoadPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadPasswordProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadPasswordRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _LoadPasswordProviderElement
    extends AutoDisposeFutureProviderElement<String?> with LoadPasswordRef {
  _LoadPasswordProviderElement(super.provider);

  @override
  String get id => (origin as LoadPasswordProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
