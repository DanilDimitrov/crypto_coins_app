import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/models/crypto_coin.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;
  State<StatefulWidget> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  late CryptoCoin coin;
  @override
  void initState() {
    coin = widget.coin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coinInUsd = coin.priceInUSD.toStringAsFixed(2);
    final lowCoinInUsd = coin.lowDay.toStringAsFixed(2);
    final highCoinInUsd = coin.highDay.toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(coin.imageUrl, scale: 2.3),
                const SizedBox(height: 16),
                Text(
                  coin.name,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 500,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 10, 10, 10),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      '$coinInUsd \$',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 500,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 10, 10, 10),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hight 24 Hour', style: TextStyle(fontWeight: FontWeight.w600),),
                          Text('$highCoinInUsd \$', style: TextStyle(fontWeight: FontWeight.w600),),

                        ],
                      ),
                      SizedBox(height: 8.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Low 24 Hour', style: TextStyle(fontWeight: FontWeight.w600),),
                          Text('$lowCoinInUsd \$', style: TextStyle(fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onRefresh: () async => 0,
      ),
    );
  }
}
