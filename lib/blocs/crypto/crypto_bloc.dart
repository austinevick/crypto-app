import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_pattern/models/coin_model.dart';
import 'package:bloc_pattern/repositories/crypto_repository.dart';
import 'package:flutter/cupertino.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CrytoRepository _crytoRepository;
  CryptoBloc({
    @required CrytoRepository crytoRepository,
  })  : assert(crytoRepository != null),
        _crytoRepository = crytoRepository;

  @override
  CryptoState get initialState => CryptoEmpty();

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* mapAppStartedToState();
    } else if (event is RefreshCoins) {
      yield* getCoins(coins: []);
    } else if (event is LoadMoreCoins) {
      yield* mapLoadMoreCoinsToState(event);
    }
  }

  Stream<CryptoState> getCoins({List<Coin> coins, int page = 0}) async* {
    //Request coins
    try {
      List<Coin> newCoinsList =
          coins + await _crytoRepository.getTopCoins(page: page);
      yield CryptoLoaded(coins: newCoinsList);
    } catch (e) {
      yield CryptoError();
    }
  }

  Stream<CryptoState> mapAppStartedToState() async* {
    yield CryptoLoading();
    yield* getCoins(coins: []);
  }

  Stream<CryptoState> mapLoadMoreCoinsToState(LoadMoreCoins event) async* {
    final int nextPage = event.coins.length ~/ CrytoRepository.perPage;
    yield* getCoins(coins: event.coins, page: nextPage);
  }
}
