// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_thought_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$thoughtRepositoryHash() => r'9d005e21334d8495a2deb598d4aedce2f690bfc9';

/// See also [thoughtRepository].
@ProviderFor(thoughtRepository)
final thoughtRepositoryProvider =
    AutoDisposeProvider<ThoughtRepository>.internal(
  thoughtRepository,
  name: r'thoughtRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$thoughtRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ThoughtRepositoryRef = AutoDisposeProviderRef<ThoughtRepository>;
String _$thoughtsHash() => r'61de7a29364c2edaf33816f950de272ba99e9dae';

/// See also [thoughts].
@ProviderFor(thoughts)
final thoughtsProvider = AutoDisposeFutureProvider<List<Thought>>.internal(
  thoughts,
  name: r'thoughtsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$thoughtsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ThoughtsRef = AutoDisposeFutureProviderRef<List<Thought>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
