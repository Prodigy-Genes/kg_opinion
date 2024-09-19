import 'package:flutter/material.dart';
import 'package:kg_opinion/pages/about.dart';
import 'package:kg_opinion/pages/article.dart'; // Ensure this is correctly imported
import 'package:kg_opinion/pages/contact.dart';
import 'package:kg_opinion/pages/home.dart';
import 'package:kg_opinion/pages/route/main_layout.dart';

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
        // Set a dark theme
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E), // Dark background
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF00FFAB), // Neon green for titles
            fontSize: 36, // Title size
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono', // Techy font
          ),
          bodyLarge: TextStyle(
            color: Colors.white70, // Light grey for content
            fontSize: 18, // Content size
            fontFamily: 'RobotoMono', // Techy font
          ),
          bodyMedium: TextStyle(
            color: Colors.white54, // Slightly lighter grey
            fontSize: 16,
            fontFamily: 'RobotoMono',
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF00FFAB), // Neon green for buttons
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: const Color(0xFF00FFAB), // Text color for buttons
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.4),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.white24, // Divider color
          thickness: 1,
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainLayout(child: HomePage()),
        '/about': (context) => const MainLayout(child: AboutPage()),
        '/contact': (context) => const MainLayout(child: ContactPage()),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/blog') {
          final args = settings.arguments as Map<String, String>?;
          return MaterialPageRoute(
            builder: (context) => MainLayout(
              child: BlogPage(
                title: args?['title'] ?? 'Default Title',
                content: args?['content'] ?? 'Default Content',
                summary: args?['summary'] ?? 'Default Summary',
              ),
            ),
          );
        }
        // Handle unknown routes
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
    );
  }
}
