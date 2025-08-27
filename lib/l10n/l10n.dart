import 'package:flutter/widgets.dart';
import 'package:travel_app/l10n/gen/app_localizations.dart';

export 'package:travel_app/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
