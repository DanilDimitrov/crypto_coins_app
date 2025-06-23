import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/models/crypto_coin.dart';
import 'package:flutter_app/router/router.dart';

class CryptoCoinTail extends StatelessWidget {
  const CryptoCoinTail({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text("${coin.priceInUSD} \$", style: theme.textTheme.labelSmall),
      leading:Image.network(coin.imageUrl),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        // Navigator.of(
        //   context,
        // ).pushNamed('/coin', arguments: {"coin": coin});
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
      },
    );
  }
}
