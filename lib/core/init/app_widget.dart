import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/core/init/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterConfig = getIt<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterConfig.router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
