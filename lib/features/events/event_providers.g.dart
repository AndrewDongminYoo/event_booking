// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(eventRepository)
const eventRepositoryProvider = EventRepositoryProvider._();

final class EventRepositoryProvider extends $FunctionalProvider<EventRepository, EventRepository, EventRepository>
    with $Provider<EventRepository> {
  const EventRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventRepositoryHash();

  @$internal
  @override
  $ProviderElement<EventRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  EventRepository create(Ref ref) {
    return eventRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventRepository>(value),
    );
  }
}

String _$eventRepositoryHash() => r'4d8a50d9f9b34c61169b71e1255753cb44ba88bc';

@ProviderFor(events)
const eventsProvider = EventsProvider._();

final class EventsProvider extends $FunctionalProvider<List<Event>, List<Event>, List<Event>>
    with $Provider<List<Event>> {
  const EventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventsHash();

  @$internal
  @override
  $ProviderElement<List<Event>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<Event> create(Ref ref) {
    return events(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Event> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Event>>(value),
    );
  }
}

String _$eventsHash() => r'bd7cb311ca61d2da5ea7d5b8b58de3989ea9e1d0';

@ProviderFor(filteredEvents)
const filteredEventsProvider = FilteredEventsFamily._();

final class FilteredEventsProvider extends $FunctionalProvider<List<Event>, List<Event>, List<Event>>
    with $Provider<List<Event>> {
  const FilteredEventsProvider._({
    required FilteredEventsFamily super.from,
    required ({String? query, String? artist, DateTimeRange<DateTime>? range}) super.argument,
  }) : super(
         retry: null,
         name: r'filteredEventsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredEventsHash();

  @override
  String toString() {
    return r'filteredEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<Event>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  List<Event> create(Ref ref) {
    final argument = this.argument as ({String? query, String? artist, DateTimeRange<DateTime>? range});
    return filteredEvents(
      ref,
      query: argument.query,
      artist: argument.artist,
      range: argument.range,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Event> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Event>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredEventsHash() => r'1c3272490d933b819fd286b5481cd2902dea100c';

final class FilteredEventsFamily extends $Family
    with $FunctionalFamilyOverride<List<Event>, ({String? query, String? artist, DateTimeRange<DateTime>? range})> {
  const FilteredEventsFamily._()
    : super(
        retry: null,
        name: r'filteredEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FilteredEventsProvider call({
    String? query,
    String? artist,
    DateTimeRange<DateTime>? range,
  }) => FilteredEventsProvider._(
    argument: (query: query, artist: artist, range: range),
    from: this,
  );

  @override
  String toString() => r'filteredEventsProvider';
}

@ProviderFor(eventWithBookingStatus)
const eventWithBookingStatusProvider = EventWithBookingStatusProvider._();

final class EventWithBookingStatusProvider
    extends $FunctionalProvider<Map<Event, bool>, Map<Event, bool>, Map<Event, bool>>
    with $Provider<Map<Event, bool>> {
  const EventWithBookingStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventWithBookingStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventWithBookingStatusHash();

  @$internal
  @override
  $ProviderElement<Map<Event, bool>> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  Map<Event, bool> create(Ref ref) {
    return eventWithBookingStatus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<Event, bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<Event, bool>>(value),
    );
  }
}

String _$eventWithBookingStatusHash() => r'a1c139394e19df8fee2658102e967e3dc3cc4aba';
