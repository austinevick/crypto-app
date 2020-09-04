import 'package:bloc_pattern/blocs/crypto/crypto_bloc.dart';
import 'package:bloc_pattern/repositories/crypto_repository.dart';
import 'package:bloc_pattern/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoBloc>(
        create: (context) => CryptoBloc(
              crytoRepository: CrytoRepository(),
            )..add(
                AppStarted(),
              ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Crypto App',
          theme: ThemeData(
            primaryColor: Colors.black,
            accentColor: Colors.tealAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ));
  }
}
