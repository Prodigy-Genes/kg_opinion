import 'package:flutter/material.dart';
import 'package:kg_opinion/pages/about.dart';
import 'package:kg_opinion/pages/contact.dart';
import 'package:kg_opinion/pages/home.dart';

void main() {
  runApp(const KgOpinionApp());
}

class KgOpinionApp extends StatelessWidget {
  const KgOpinionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KgOpinion Blog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
