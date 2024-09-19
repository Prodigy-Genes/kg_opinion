import 'package:flutter/material.dart';
import 'package:kg_opinion/components/footer.dart';
import 'package:kg_opinion/components/navigation_bar.dart'; // Custom navigation bar or widget

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color:const Color(0xFF0F2027), // Dark background for a techy look
 // Dark background for navigation section
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Navigation_Bar(), // Your Navigation_Bar widget
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: child,
            ),
          ),
          const Footer(), // Your Footer widget
        ],
      ),
    );
  }
}
