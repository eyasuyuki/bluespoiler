// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluesky_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testLoginHash() => r'97698389764f9acf0ea2255d1c2016990e2e51f7';

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

/// See also [testLogin].
@ProviderFor(testLogin)
const testLoginProvider = TestLoginFamily();

/// See also [testLogin].
class TestLoginFamily extends Family<AsyncValue<bool>> {
  /// See also [testLogin].
  const TestLoginFamily();

  /// See also [testLogin].
  TestLoginProvider call({
    required String email,
    required String password,
  }) {
    return TestLoginProvider(
      email: email,
      password: password,
    );
  }

  @override
  TestLoginProvider getProviderOverride(
    covariant TestLoginProvider provider,
  ) {
    return call(
      email: provider.email,
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
  String? get name => r'testLoginProvider';
}

/// See also [testLogin].
class TestLoginProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [testLogin].
  TestLoginProvider({
    required String email,
    required String password,
  }) : this._internal(
          (ref) => testLogin(
            ref as TestLoginRef,
            email: email,
            password: password,
          ),
          from: testLoginProvider,
          name: r'testLoginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$testLoginHash,
          dependencies: TestLoginFamily._dependencies,
          allTransitiveDependencies: TestLoginFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  TestLoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<bool> Function(TestLoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TestLoginProvider._internal(
        (ref) => create(ref as TestLoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _TestLoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TestLoginProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TestLoginRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _TestLoginProviderElement extends AutoDisposeFutureProviderElement<bool>
    with TestLoginRef {
  _TestLoginProviderElement(super.provider);

  @override
  String get email => (origin as TestLoginProvider).email;
  @override
  String get password => (origin as TestLoginProvider).password;
}

String _$postArticleHash() => r'33095a70eff51d8ae285e9c2f396987cc44ca5ad';

/// See also [postArticle].
@ProviderFor(postArticle)
const postArticleProvider = PostArticleFamily();

/// See also [postArticle].
class PostArticleFamily extends Family<AsyncValue<PostResult>> {
  /// See also [postArticle].
  const PostArticleFamily();

  /// See also [postArticle].
  PostArticleProvider call({
    required Article article,
  }) {
    return PostArticleProvider(
      article: article,
    );
  }

  @override
  PostArticleProvider getProviderOverride(
    covariant PostArticleProvider provider,
  ) {
    return call(
      article: provider.article,
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
  String? get name => r'postArticleProvider';
}

/// See also [postArticle].
class PostArticleProvider extends AutoDisposeFutureProvider<PostResult> {
  /// See also [postArticle].
  PostArticleProvider({
    required Article article,
  }) : this._internal(
          (ref) => postArticle(
            ref as PostArticleRef,
            article: article,
          ),
          from: postArticleProvider,
          name: r'postArticleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postArticleHash,
          dependencies: PostArticleFamily._dependencies,
          allTransitiveDependencies:
              PostArticleFamily._allTransitiveDependencies,
          article: article,
        );

  PostArticleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.article,
  }) : super.internal();

  final Article article;

  @override
  Override overrideWith(
    FutureOr<PostResult> Function(PostArticleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostArticleProvider._internal(
        (ref) => create(ref as PostArticleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        article: article,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PostResult> createElement() {
    return _PostArticleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostArticleProvider && other.article == article;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, article.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostArticleRef on AutoDisposeFutureProviderRef<PostResult> {
  /// The parameter `article` of this provider.
  Article get article;
}

class _PostArticleProviderElement
    extends AutoDisposeFutureProviderElement<PostResult> with PostArticleRef {
  _PostArticleProviderElement(super.provider);

  @override
  Article get article => (origin as PostArticleProvider).article;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
