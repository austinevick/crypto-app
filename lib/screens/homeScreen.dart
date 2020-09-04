import 'package:bloc_pattern/models/coin_model.dart';
import 'package:bloc_pattern/repositories/crypto_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final crytoRepository = CrytoRepository();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Coins'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Colors.grey[900],
            ],
          ),
        ),
        child: FutureBuilder<List<Coin>>(
            future: crytoRepository.getTopCoins(page: page),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(Theme.of(context).accentColor),
                  ),
                );
              }
              final List<Coin> coins = snapshot.data;
              return ListView.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    final coin = coins[index];
                    return ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${++index}',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        coin.fullName,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        coin.name,
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: Text(
                        '\$${coin.price.toStringAsFixed(4)}',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}