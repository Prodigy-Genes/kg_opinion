import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Welcome to KgOpinion Blog! We provide insightful articles on various topics. Stay tuned for more updates!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
