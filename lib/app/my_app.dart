import 'package:comitons_test/domain/objectbox_service.dart';
import 'package:comitons_test/router/app_router.dart';
import 'package:comitons_test/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final ObjectBoxService objectBoxService;

  MyApp({Key? key, required this.objectBoxService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.themeData,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) {
        return MultiProvider(
          providers: [
            Provider<ObjectBoxService>.value(value: objectBoxService),
          ],
          child: router!,
        );
      },
    );
  }
}
