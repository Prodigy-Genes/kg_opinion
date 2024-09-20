import 'package:flutter/material.dart';
import 'package:kg_opinion/components/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side: Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildContent(),
                  const SizedBox(height: 30),
                  _buildContactInfo(),
                  const SizedBox(height: 30),
                  _buildSubscribeButton(),
                ],
              ),
            ),
          ),
          // Right side: Image space
          Container(
            width: MediaQuery.of(context).size.width * 0.4, 
            height: MediaQuery.of(context).size.height * 0.4, 
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/about_us.png', 
              fit: BoxFit.fill,
              height: 400,
              width: 400,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(), // Footer at the bottom
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'About KgOpinion',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            letterSpacing: 1.5,
            fontFamily: 'RobotoMono',
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 39, 39, 39),
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
        fontSize: 24,
        height: 1.6,
        color: Colors.white,
        fontFamily: 'RobotoMono',
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
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF00BFFF),
            fontFamily: 'RobotoMono',
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Email: contact@kgopinion.com',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            fontFamily: 'RobotoMono',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Follow us on social media for updates:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            fontFamily: 'RobotoMono',
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
        height: 32,
        width: 32,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSubscribeButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle subscription logic
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: const Text('Subscribe to Our Newsletter'),
    );
  }
}
