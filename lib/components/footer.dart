import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: const Color(0xFF1A1A1A), // Dark gray for a techy feel
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '© 2024 KgOpinion. All rights reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14, // Slightly smaller for a techy look
              fontWeight: FontWeight.w300,
              fontFamily: 'RobotoMono', // Techy font
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterLink('Privacy Policy', context),
              const SizedBox(width: 15),
              _buildFooterLink('Terms of Use', context),
              // Optionally add more footer links here
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon('assets/icons/x.png', 'https://x.com'),
              const SizedBox(width: 10),
              _buildSocialIcon('assets/icons/linkedin.png', 'https://linkedin.com'),
              // Add more social media icons if needed
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or action for the footer link
        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14, // Slightly smaller for consistency
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          fontFamily: 'RobotoMono', // Techy font
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String imagePath, String url) {
    return GestureDetector(
      onTap: () {
        // Open social media link
        // Example: launch(url);
      },
      child: Image.asset(
        imagePath,
        width: 24,
        height: 24,
        color: Colors.white,
      ),
    );
  }
}
