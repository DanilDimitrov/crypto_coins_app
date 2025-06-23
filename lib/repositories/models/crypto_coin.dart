import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 1)
class CryptoCoin extends Equatable{
  @HiveField(1)
  final String name;

  @HiveField(2)
  final double priceInUSD;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final double highDay;

  @HiveField(5)
  final double lowDay;

  const CryptoCoin({required this.name, required this.priceInUSD, required this.imageUrl, required this.highDay, required this.lowDay});

  @override
  // TODO: implement props
  List<Object?> get props => [name, priceInUSD, imageUrl, highDay, lowDay];

}
