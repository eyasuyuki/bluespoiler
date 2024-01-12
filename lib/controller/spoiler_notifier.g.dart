// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoiler_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spoilerHash() => r'ac114fce828345963b9354ca2ebf9dbaeab89555';

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

/// See also [spoiler].
@ProviderFor(spoiler)
const spoilerProvider = SpoilerFamily();

/// See also [spoiler].
class SpoilerFamily extends Family<Spoiler> {
  /// See also [spoiler].
  const SpoilerFamily();

  /// See also [spoiler].
  SpoilerProvider call(
    String input,
  ) {
    return SpoilerProvider(
      input,
    );
  }

  @override
  SpoilerProvider getProviderOverride(
    covariant SpoilerProvider provider,
  ) {
    return call(
      provider.input,
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
  String? get name => r'spoilerProvider';
}

/// See also [spoiler].
class SpoilerProvider extends AutoDisposeProvider<Spoiler> {
  /// See also [spoiler].
  SpoilerProvider(
    String input,
  ) : this._internal(
          (ref) => spoiler(
            ref as SpoilerRef,
            input,
          ),
          from: spoilerProvider,
          name: r'spoilerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$spoilerHash,
          dependencies: SpoilerFamily._dependencies,
          allTransitiveDependencies: SpoilerFamily._allTransitiveDependencies,
          input: input,
        );

  SpoilerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.input,
  }) : super.internal();

  final String input;

  @override
  Override overrideWith(
    Spoiler Function(SpoilerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SpoilerProvider._internal(
        (ref) => create(ref as SpoilerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        input: input,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Spoiler> createElement() {
    return _SpoilerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SpoilerProvider && other.input == input;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, input.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SpoilerRef on AutoDisposeProviderRef<Spoiler> {
  /// The parameter `input` of this provider.
  String get input;
}

class _SpoilerProviderElement extends AutoDisposeProviderElement<Spoiler>
    with SpoilerRef {
  _SpoilerProviderElement(super.provider);

  @override
  String get input => (origin as SpoilerProvider).input;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
