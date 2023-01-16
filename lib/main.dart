import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flipkart_clone/widgets/splash_icon.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flipkart Clone',
      debugShowCheckedModeBanner: true,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.blue, secondary: Colors.blueGrey),
      ),
      // home: const MyHomeClass(),
      home: AnimatedSplashScreen(
        // splash: Icon(Icons.home),
        splash: SplashIcon(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue,
        nextScreen: MyHomeClass(),
      ),
      // Center(
      //   child: Container(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(height: 100 , width: 100, color: Colors.blue,),
      //         Text('Splash Screen'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class MyHomeClass extends StatelessWidget {
  const MyHomeClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flipkart'),
      ),
    );
  }
}
