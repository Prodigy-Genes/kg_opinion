import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0), // Adjust the left margin here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 66, // Radius for the circular avatar
            backgroundImage: const AssetImage('assets/images/Logo.jpg'), // Logo image
            backgroundColor: Colors.transparent, // Ensure no background color
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2), // Thick white border
              ),
            ),
          ),
          const SizedBox(height: 2), // Space between logo and title
          const Text(
            'KGOPINION',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 26,
              fontWeight: FontWeight.w100,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
