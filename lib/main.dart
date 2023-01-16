import 'package:flipkart_clone/providers/Language_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flipkart_clone/providers/log_provider.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flipkart_clone/screens/select_language_screen.dart';

import 'package:flipkart_clone/widgets/side_drawer.dart';
import 'package:flipkart_clone/widgets/splash_icon.dart';

int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('chooseLanguage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MaterialApp(
        title: 'Flipkart Clone',
        debugShowCheckedModeBanner: true,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.blue, secondary: Colors.blueGrey),
        ),

        routes: {
          MyHomeClass.routeName : (context) => MyHomeClass()
        },
        // home: const MyHomeClass(),
        home: AnimatedSplashScreen(
          // splash: Icon(Icons.home),
          splash: SplashIcon(),
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blue,
          // nextScreen: MyHomeClass(),
          nextScreen: isViewed != 0
              ? SelectLanguageScreen()
              : MyHomeClass(),
        ),
      ),
    );
  }
}

class MyHomeClass extends StatelessWidget {
  static const routeName = '/my-home-class';
  const MyHomeClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flipkart'),
      ),
      drawer: SideDrawer(),
    );
  }
}
