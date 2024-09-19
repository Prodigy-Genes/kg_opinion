// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'header.dart'; // Import the Header component

class Navigation_Bar extends StatefulWidget {
  final String? currentRoute; // Accept currentRoute

  const Navigation_Bar({super.key, this.currentRoute});

  @override
  _Navigation_BarState createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  String? _hoveredRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F2027),
            Color(0xFF203A43),
            Color(0xFF2C5364),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 2,
            child: Header(),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navItem('Home', 'assets/icons/home.png', context, '/home'),
                _navItem('About', 'assets/icons/about.png', context, '/about'),
                _navItem('Blog', 'assets/icons/blog.png', context, '/blog', arguments: {
                  'title': 'Blog Title',
                  'content': 'Blog Content',
                }),
                _navItem('Contact', 'assets/icons/contact.png', context, '/contact'),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Search functionality here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    String label, String imagePath, BuildContext context, String route,
    {Map<String, String>? arguments}) {
    
    // Use `currentRoute` to match the base route name only
    final bool isHovered = _hoveredRoute == route;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredRoute = route;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredRoute = null;
        });
      },
      child: GestureDetector(
        onTap: () {
          if (arguments != null) {
            Navigator.pushNamed(context, route, arguments: arguments);
          } else {
            Navigator.pushNamed(context, route);
          }
        },
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
              color: isHovered ? Colors.blueAccent : Colors.white,
            ),
            const SizedBox(width: 8),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 200),
              tween: Tween<double>(
                begin: 16.0,
                end: isHovered ? 20.0 : 16.0,
              ),
              builder: (context, size, child) {
                return Text(
                  label,
                  style: TextStyle(
                    color: (isHovered
                            ? Colors.blueAccent
                            : Colors.white), // Blue on hover, white otherwise
                    fontSize: size,
                    fontFamily: 'Bona Nova SC',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
