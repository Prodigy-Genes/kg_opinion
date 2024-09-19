import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027), // Dark background for a techy look
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildContent(),
                const SizedBox(height: 30),
                _buildContactInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About KgOpinion',
          style: TextStyle(
            fontSize: 36, // Larger size for impact
            fontWeight: FontWeight.bold,
            color: Color(0xFF00BFFF), // Bright cyan for contrast
            letterSpacing: 1.5,
            fontFamily: 'RobotoMono', // Techy font
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 92, 92, 92),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/images/Logo.jpg', // Replace with your logo image path
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return const Text(
      'Welcome to KgOpinion Blog! We provide insightful articles on various topics related to technology and science. Our goal is to deliver high-quality content that keeps you informed and engaged. Stay tuned for more updates and follow us for the latest articles.',
      style: TextStyle(
        fontSize: 18,
        height: 1.6, // Line height for readability
        color: Colors.white70, // Light text color for contrast
        fontFamily: 'RobotoMono', // Techy font
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Us:',
          style: TextStyle(
            fontSize: 24, // Larger size for emphasis
            fontWeight: FontWeight.w600,
            color: Color(0xFF00BFFF), // Bright cyan for contrast
            fontFamily: 'RobotoMono', // Techy font
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Email: contact@kgopinion.com',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70, // Light text color for contrast
            fontFamily: 'RobotoMono', // Techy font
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Follow us on social media for updates:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70, // Light text color for contrast
            fontFamily: 'RobotoMono', // Techy font
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildSocialMediaIcon('assets/icons/whatsapp.png', 'https://whatsapp.com'),
            const SizedBox(width: 15),
            _buildSocialMediaIcon('assets/icons/x.png', 'https://x.com'),
            const SizedBox(width: 15),
            _buildSocialMediaIcon('assets/icons/linkedin.png', 'https://linkedin.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialMediaIcon(String imagePath, String url) {
    return GestureDetector(
      onTap: () {
        // Launch the URL in a web browser
        // Example: launch(url);
      },
      child: Image.asset(
        imagePath,
        height: 32, // Slightly larger size for visibility
        width: 32, // Slightly larger size for visibility
        fit: BoxFit.cover,
      ),
    );
  }
}
