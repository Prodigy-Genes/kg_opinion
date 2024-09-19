// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'header.dart'; // Import the Header component

class Navigation_Bar extends StatefulWidget {
  const Navigation_Bar({super.key});

  @override
  _Navigation_BarState createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  String? _selectedRoute;
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
          ], // Dark techy gradient
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
          // Header component
          const Expanded(
            flex: 2, // Adjust the flex to control the space allocated to the header
            child: Header(),
          ),

          // Navigation bar
          Expanded(
            flex: 4, // Adjust the flex to control the space allocated to the navigation bar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navItem('Home', 'assets/icons/home.png', context, '/home'),
                _navItem('About', 'assets/icons/about.png', context, '/about'),
                _navItem(
                  'Blog', 
                  'assets/icons/blog.png', 
                  context, 
                  '/blog', 
                  arguments: {'title': 'Blog Title', 'content': 'Blog Content'}
                ),
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

  Widget _navItem(String label, String imagePath, BuildContext context, String route, {Map<String, String>? arguments}) {
    final bool isSelected = _selectedRoute == route;
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
          setState(() {
            _selectedRoute = route;
          });
          if (arguments != null) {
            Navigator.pushNamed(context, route, arguments: arguments); // Navigate with arguments
          } else {
            Navigator.pushNamed(context, route); // Navigate without arguments
          }
        },
        child: Row(
          children: [
            Image.asset(
              imagePath, 
              width: 24, 
              height: 24, 
              color: isSelected || isHovered ? Colors.blueAccent : Colors.white, // Change icon color based on state
            ),
            const SizedBox(width: 8), 
            Text(
              label,
              style: TextStyle(
                color: isSelected || isHovered ? Colors.blueAccent : Colors.white, // Change text color based on state
                fontSize: 16,
                fontFamily: 'RobotoMono', // Techy font
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Change font weight when selected
              ),
            ),
          ],
        ),
      ),
    );
  }
}
