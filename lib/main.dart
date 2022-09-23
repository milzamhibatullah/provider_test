import 'package:flutter/material.dart';
import 'package:provider_test/ui/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) =>  HomeScreen(),
      },
    ),
  );
}
