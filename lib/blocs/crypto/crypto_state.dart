part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

//initial state
class CryptoEmpty extends CryptoState {}

//Fetching coins
class CryptoLoading extends CryptoState {}

//Retrieved coins
class CryptoLoaded extends CryptoState {
  final List<Coin> coins;
  CryptoLoaded({
    this.coins,
  });
  @override
  List<Object> get props => [coins];
  @override
  String toString() => 'CryptoLoaded { coins: $coins }';
}

//API request error
class CryptoError extends CryptoState {}
