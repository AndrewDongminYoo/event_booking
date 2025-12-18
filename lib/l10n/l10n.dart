// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 🌎 Project imports:
import 'package:event_booking/l10n/gen/app_localizations.dart';

export 'package:event_booking/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
