// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kg_opinion/pages/about.dart';
import 'package:kg_opinion/pages/article.dart';
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
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.blueAccent,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono',
          ),
          bodyLarge: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontFamily: 'RobotoMono',
          ),
          bodyMedium: TextStyle(
            color: Colors.white54,
            fontSize: 16,
            fontFamily: 'RobotoMono',
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF00FFAB),
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xFF00FFAB),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.4),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.white24,
          thickness: 1,
        ),
      ),
      initialRoute: '/home',
      navigatorObservers: [RouteObserver()],
      routes: {
        '/home': (context) => const MainLayout(child: HomePage()),
        '/about': (context) => const MainLayout(child: AboutPage()),
        '/contact': (context) => const MainLayout(child: ContactPage()),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/blog') {
          final args = settings.arguments as Map<String, String>? ?? {};
          final title = args['title'] ?? 'Default Title';
          final content = args['content'] ?? 'Default Content';
          final summary = args['summary'] ?? 'Default Summary';
          return MaterialPageRoute(
            builder: (context) => MainLayout(
              child: BlogPage(
                title: title,
                content: content,
                summary: summary,
              ),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
    );
  }
}

class RouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    print('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print('Route popped: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('Route replaced: ${newRoute?.settings.name}');
  }
}
