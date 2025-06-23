import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_app/repositories/models/crypto_coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'crypto_coins_list_app.dart';


const crypto_coins_box_name = 'crypto_coins_box';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);

    await Hive.initFlutter();
    Hive.registerAdapter(CryptoCoinAdapter());

    final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(crypto_coins_box_name);


    final dio = Dio();
    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(printResponseData: false),
      ),
    );

    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printEventFullData: false,
        printStateFullData: false,
      ),
    );

    GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CryptoCoins(dio: dio, cryptoCoinsBox: cryptoCoinsBox),
    );

    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    talker.info(app.options.projectId);

    FlutterError.onError = (details) =>
        talker.handle(details.exception, details.stack);

    runApp(CryptoCurrenciesListApp());
  }, (error, stack) {
    final talker = GetIt.I<Talker>();
    talker.handle(error, stack);
  });

}
