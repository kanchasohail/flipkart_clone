import 'package:flipkart_clone/providers/side_drawer_list_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flipkart_clone/providers/Language_provider.dart';
import 'package:flipkart_clone/providers/log_provider.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flipkart_clone/screens/select_language_screen.dart';

import 'package:flipkart_clone/pages/account_page.dart';
import 'package:flipkart_clone/pages/cart_page.dart';
import 'package:flipkart_clone/pages/categories_page.dart';
import 'package:flipkart_clone/pages/home_page.dart';
import 'package:flipkart_clone/pages/notifications_page.dart';

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
        ChangeNotifierProvider(create: (_) => SideDrawerListProvider())
      ],
      child: MaterialApp(
        title: 'Flipkart Clone',
        debugShowCheckedModeBanner: true,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.blue, secondary: Colors.blueGrey),
        ),

        routes: {MyHomeClass.routeName: (context) => MyHomeClass()},
        // home: const MyHomeClass(),
        home: AnimatedSplashScreen(
          // splash: Icon(Icons.home),
          splash: SplashIcon(),
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blue,
          // nextScreen: MyHomeClass(),
          nextScreen: isViewed != 0 ? SelectLanguageScreen() : MyHomeClass(),
        ),
      ),
    );
  }
}

class MyHomeClass extends StatefulWidget {
  static const routeName = '/my-home-class';

  MyHomeClass({super.key});

  @override
  State<MyHomeClass> createState() => _MyHomeClassState();
}

class _MyHomeClassState extends State<MyHomeClass> {
  int _currentIndex = 0;

  final screens = [
    HomePage(),
    CategoriesPage(),
    NotificationsPage(),
    AccountPage(),
    CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flipkart'),
      // ),
      body: IndexedStack(index: _currentIndex, children: screens),
      drawer: SideDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blueGrey,
        // selectedItemColor: Colors.blue,
        // unselectedItemColor: Colors.grey.shade600,
        // unselectedFontSize: 12,
        selectedFontSize: 12,

        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_outlined), label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
        ],
      ),
    );
  }
}
