// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Tracks viewed event ids (most recent first).

@ProviderFor(ViewedEvents)
const viewedEventsProvider = ViewedEventsProvider._();

/// Tracks viewed event ids (most recent first).
final class ViewedEventsProvider extends $NotifierProvider<ViewedEvents, List<BigInt>> {
  /// Tracks viewed event ids (most recent first).
  const ViewedEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'viewedEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$viewedEventsHash();

  @$internal
  @override
  ViewedEvents create() => ViewedEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BigInt> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BigInt>>(value),
    );
  }
}

String _$viewedEventsHash() => r'8afabf2ddec7d4ae84d0f0e4d4c21213da7524c4';

/// Tracks viewed event ids (most recent first).

abstract class _$ViewedEvents extends $Notifier<List<BigInt>> {
  List<BigInt> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<BigInt>, List<BigInt>>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<List<BigInt>, List<BigInt>>, List<BigInt>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

/// Produces a ranked list of recommended events based on recent views and bookings.

@ProviderFor(recommendations)
const recommendationsProvider = RecommendationsProvider._();

/// Produces a ranked list of recommended events based on recent views and bookings.

final class RecommendationsProvider extends $FunctionalProvider<List<Event>, List<Event>, List<Event>>
    with $Provider<List<Event>> {
  /// Produces a ranked list of recommended events based on recent views and bookings.
  const RecommendationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recommendationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recommendationsHash();

  @$internal
  @override
  $ProviderElement<List<Event>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<Event> create(Ref ref) {
    return recommendations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Event> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Event>>(value),
    );
  }
}

String _$recommendationsHash() => r'085aa0d5487b03dce427d1a9aab71f05454c3955';
