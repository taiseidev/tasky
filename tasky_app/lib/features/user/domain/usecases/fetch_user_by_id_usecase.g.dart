// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_by_id_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserByIdUsecaseHash() =>
    r'1cb49372d200a9efa8ee7f9c337c5d4ee5fa4414';

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

/// See also [fetchUserByIdUsecase].
@ProviderFor(fetchUserByIdUsecase)
const fetchUserByIdUsecaseProvider = FetchUserByIdUsecaseFamily();

/// See also [fetchUserByIdUsecase].
class FetchUserByIdUsecaseFamily extends Family<AsyncValue<Result<User>>> {
  /// See also [fetchUserByIdUsecase].
  const FetchUserByIdUsecaseFamily();

  /// See also [fetchUserByIdUsecase].
  FetchUserByIdUsecaseProvider call(
    UserId userId,
  ) {
    return FetchUserByIdUsecaseProvider(
      userId,
    );
  }

  @override
  FetchUserByIdUsecaseProvider getProviderOverride(
    covariant FetchUserByIdUsecaseProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'fetchUserByIdUsecaseProvider';
}

/// See also [fetchUserByIdUsecase].
class FetchUserByIdUsecaseProvider
    extends AutoDisposeFutureProvider<Result<User>> {
  /// See also [fetchUserByIdUsecase].
  FetchUserByIdUsecaseProvider(
    UserId userId,
  ) : this._internal(
          (ref) => fetchUserByIdUsecase(
            ref as FetchUserByIdUsecaseRef,
            userId,
          ),
          from: fetchUserByIdUsecaseProvider,
          name: r'fetchUserByIdUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserByIdUsecaseHash,
          dependencies: FetchUserByIdUsecaseFamily._dependencies,
          allTransitiveDependencies:
              FetchUserByIdUsecaseFamily._allTransitiveDependencies,
          userId: userId,
        );

  FetchUserByIdUsecaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final UserId userId;

  @override
  Override overrideWith(
    FutureOr<Result<User>> Function(FetchUserByIdUsecaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserByIdUsecaseProvider._internal(
        (ref) => create(ref as FetchUserByIdUsecaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result<User>> createElement() {
    return _FetchUserByIdUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserByIdUsecaseProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserByIdUsecaseRef on AutoDisposeFutureProviderRef<Result<User>> {
  /// The parameter `userId` of this provider.
  UserId get userId;
}

class _FetchUserByIdUsecaseProviderElement
    extends AutoDisposeFutureProviderElement<Result<User>>
    with FetchUserByIdUsecaseRef {
  _FetchUserByIdUsecaseProviderElement(super.provider);

  @override
  UserId get userId => (origin as FetchUserByIdUsecaseProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
