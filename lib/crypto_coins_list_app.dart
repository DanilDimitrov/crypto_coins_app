import 'package:flutter/material.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatefulWidget {
  const CryptoCurrenciesListApp({super.key});



  @override
  State<StatefulWidget> createState() => _CryptoCurrenciesListAppState();

}

class _CryptoCurrenciesListAppState extends State<CryptoCurrenciesListApp>{
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>())
        ],
      ),
    );
  }
}
