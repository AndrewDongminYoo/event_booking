// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends $FunctionalProvider<AsyncValue<SharedPreferences>, SharedPreferences, FutureOr<SharedPreferences>>
    with $FutureModifier<SharedPreferences>, $FutureProvider<SharedPreferences> {
  const SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPreferences(ref);
  }
}

String _$sharedPreferencesHash() => r'822246b57cce9703c8c0e7a289b80c97a085a8b8';

@ProviderFor(bookingStorage)
const bookingStorageProvider = BookingStorageProvider._();

final class BookingStorageProvider extends $FunctionalProvider<BookingStorage, BookingStorage, BookingStorage>
    with $Provider<BookingStorage> {
  const BookingStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingStorageHash();

  @$internal
  @override
  $ProviderElement<BookingStorage> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  BookingStorage create(Ref ref) {
    return bookingStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookingStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookingStorage>(value),
    );
  }
}

String _$bookingStorageHash() => r'71726a4f0b3285b49c2b7f3eb07ebf240fd09921';

@ProviderFor(bookingRepository)
const bookingRepositoryProvider = BookingRepositoryProvider._();

final class BookingRepositoryProvider
    extends $FunctionalProvider<BookingRepository, BookingRepository, BookingRepository>
    with $Provider<BookingRepository> {
  const BookingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingRepositoryHash();

  @$internal
  @override
  $ProviderElement<BookingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BookingRepository create(Ref ref) {
    return bookingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookingRepository>(value),
    );
  }
}

String _$bookingRepositoryHash() => r'341659f190c532580ef7eea24fb7fbc186118057';

@ProviderFor(Bookings)
const bookingsProvider = BookingsProvider._();

final class BookingsProvider extends $NotifierProvider<Bookings, List<Booking>> {
  const BookingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingsHash();

  @$internal
  @override
  Bookings create() => Bookings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Booking> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Booking>>(value),
    );
  }
}

String _$bookingsHash() => r'f34a331d4b5f23eeb0594ff5c67f2b77c5c5e46b';

abstract class _$Bookings extends $Notifier<List<Booking>> {
  List<Booking> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Booking>, List<Booking>>;
    final element =
        ref.element
            as $ClassProviderElement<AnyNotifier<List<Booking>, List<Booking>>, List<Booking>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
