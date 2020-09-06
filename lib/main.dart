import 'package:bloc_pattern/blocs/crypto/crypto_bloc.dart';
import 'package:bloc_pattern/repositories/crypto_repository.dart';
import 'package:bloc_pattern/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/splashscreen.dart';

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
            home: SplashScreen(
              loaderColor: Colors.black,
              backgroundColor: Colors.black,
              photoSize: 200,
              seconds: 5,
              image: FadeInImage(
                fadeInDuration: Duration(seconds: 7),
                placeholder: AssetImage('image/img.jpg'),
                fadeOutDuration: Duration(seconds: 1),
                image: AssetImage('image/crypto.png'),
              ),
              navigateAfterSeconds: new HomeScreen(),
              title: Text('Cryptocurrency',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            )));
  }
}
