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
      home: const MyHomeClass(),
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
