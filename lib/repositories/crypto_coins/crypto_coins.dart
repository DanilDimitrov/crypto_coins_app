import 'package:dio/dio.dart';
import 'package:flutter_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter_app/repositories/models/crypto_coin.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoins implements AbstractCoinsRepository {

  final Dio dio;

  final Box<CryptoCoin> cryptoCoinsBox;

  CryptoCoins({required this.dio, required this.cryptoCoinsBox});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {

    var cryptoCoinsList = <CryptoCoin>[];


    try {
      final responce = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD',
      );

      final data = responce.data as Map<String, dynamic>;
      final dataRaw = data['RAW'] as Map<String, dynamic>;
      cryptoCoinsList = dataRaw.entries.map((e) {
        final usdData =
        (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData['PRICE'];
        final imageUrl = usdData['IMAGEURL'];
        final highDay = usdData['HIGH24HOUR'];
        final lowDay = usdData['LOW24HOUR'];

        return CryptoCoin(name: e.key,
            priceInUSD: price,
            imageUrl: 'https://www.cryptocompare.com/$imageUrl',
            highDay: highDay,
            lowDay: lowDay);
        //
      }).toList();

      final  cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      await cryptoCoinsBox.putAll(cryptoCoinsMap);

    } catch (e, st){
      GetIt.I<Talker>().handle(e, st);
      cryptoCoinsList =  cryptoCoinsBox.values.toList();
    }
    cryptoCoinsList.sort((a, b) => b.priceInUSD.compareTo(a.priceInUSD));
    return cryptoCoinsList;
  }
}
