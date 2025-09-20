import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mohamed Elmeligy - Flutter Developer',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

