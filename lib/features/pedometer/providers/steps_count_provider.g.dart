// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getStepsCountHash() => r'1c75097928acbb30adf26b3b2f881a8b35a53a64';

/// See also [getStepsCount].
@ProviderFor(getStepsCount)
final getStepsCountProvider = AutoDisposeProvider<int>.internal(
  getStepsCount,
  name: r'getStepsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getStepsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetStepsCountRef = AutoDisposeProviderRef<int>;
String _$setStepsCountHash() => r'047e4f547f1e1114f468bcfe7e90b22b1c845fd3';

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

/// See also [setStepsCount].
@ProviderFor(setStepsCount)
const setStepsCountProvider = SetStepsCountFamily();

/// See also [setStepsCount].
class SetStepsCountFamily extends Family<AsyncValue<void>> {
  /// See also [setStepsCount].
  const SetStepsCountFamily();

  /// See also [setStepsCount].
  SetStepsCountProvider call(
    int stepsCount,
  ) {
    return SetStepsCountProvider(
      stepsCount,
    );
  }

  @override
  SetStepsCountProvider getProviderOverride(
    covariant SetStepsCountProvider provider,
  ) {
    return call(
      provider.stepsCount,
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
  String? get name => r'setStepsCountProvider';
}

/// See also [setStepsCount].
class SetStepsCountProvider extends AutoDisposeFutureProvider<void> {
  /// See also [setStepsCount].
  SetStepsCountProvider(
    int stepsCount,
  ) : this._internal(
          (ref) => setStepsCount(
            ref as SetStepsCountRef,
            stepsCount,
          ),
          from: setStepsCountProvider,
          name: r'setStepsCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setStepsCountHash,
          dependencies: SetStepsCountFamily._dependencies,
          allTransitiveDependencies:
              SetStepsCountFamily._allTransitiveDependencies,
          stepsCount: stepsCount,
        );

  SetStepsCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stepsCount,
  }) : super.internal();

  final int stepsCount;

  @override
  Override overrideWith(
    FutureOr<void> Function(SetStepsCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetStepsCountProvider._internal(
        (ref) => create(ref as SetStepsCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stepsCount: stepsCount,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SetStepsCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetStepsCountProvider && other.stepsCount == stepsCount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stepsCount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetStepsCountRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `stepsCount` of this provider.
  int get stepsCount;
}

class _SetStepsCountProviderElement
    extends AutoDisposeFutureProviderElement<void> with SetStepsCountRef {
  _SetStepsCountProviderElement(super.provider);

  @override
  int get stepsCount => (origin as SetStepsCountProvider).stepsCount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
