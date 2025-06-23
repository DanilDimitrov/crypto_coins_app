part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable{
  CryptoListEvent({this.completer});

  final Completer? completer;
}

class LoadCryptoList extends CryptoListEvent {
  LoadCryptoList({this.completer});

  final Completer? completer;

  @override
  // TODO: implement props
  List<Object?> get props => [completer];
}
