// import '../features/crypto_list_screen/crypto_list.dart';
// import '../features/crypto_single/crypto_single.dart';
//
// final routes = {
//   '/': (context) => CryptoListScreen(),
//   '/coin': (context) => CryptoCoinScreen(),
// };

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../features/crypto_list_screen/view/crypto_list_screen.dart';
import '../features/crypto_single/view/crypto_coin_screen.dart';
import '../repositories/models/crypto_coin.dart';

part 'router.gr.dart';

@AutoRouterConfig()

class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoListRoute.page, path: '/'),
    AutoRoute(page: CryptoCoinRoute.page),
  ];
}