import 'dart:convert';

import 'package:bloc_pattern/models/coin_model.dart';
import 'package:bloc_pattern/repositories/base_crypto_repository.dart';
import 'package:http/http.dart' as http;

class CrytoRepository extends BaseCryptoRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com';
  static const int _perPage = 20;

  final http.Client _httpClient;
  CrytoRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Coin>> getTopCoins({int page}) async {
    List<Coin> coins = [];
    String requestUrl =
        '$_baseUrl/data/top/totalvolfull?limit=$_perPage&tsym=USD&page=$page';
    try {
      final response = await _httpClient.get(requestUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> coinList = data['Data'];
        return coinList.map((e) => Coin.fromJson(e)).toList();
        // coinList.forEach((json) => coins.add(Coin.fromJson(json)));

      } else {
        throw Exception('');
      }
    } catch (e) {
      throw (e);
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}
