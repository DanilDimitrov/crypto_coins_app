import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/crypto_list_screen/bloc/crypto_list_bloc.dart';
import 'package:flutter_app/features/crypto_list_screen/widgets/widgets.dart';
import 'package:flutter_app/repositories/models/crypto_coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../repositories/crypto_coins/abstract_coins_repository.dart';

@RoutePage()
class CryptoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Crypto Currencies List'),
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TalkerScreen(talker: GetIt.I<Talker>())),);
        }, icon: Icon(Icons.document_scanner_outlined))
      ],),

      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.coinsList.length,
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return CryptoCoinTail(coin: coin);
                },
              );
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try again later',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
