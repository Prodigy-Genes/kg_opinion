// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kg_opinion/components/footer.dart';
import 'package:kg_opinion/components/navigation_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    // DEBUG: Print the current route to understand what route is being passed
    print('Current route: $currentRoute');
    
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFF0F2027),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Navigation_Bar(currentRoute: currentRoute), // Pass currentRoute
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: child,
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
