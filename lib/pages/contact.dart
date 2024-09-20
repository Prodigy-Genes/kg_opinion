import 'package:flutter/material.dart';
import 'package:kg_opinion/components/footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side: Image space
          Expanded(
            flex: 2, // Make the image area larger
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder(
                future: _loadImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error loading image: ${snapshot.error}'));
                  } else {
                    return Image.asset(
                      'assets/images/contact_us.png', 
                      width: 400,
                      height: 1000,
                      fit: BoxFit.fill,
                    );
                  }
                },
              ),
            ),
          ),
          // Right side: Contact form
          Expanded(
            flex: 1, // Smaller flex for the form
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get in Touch',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildContactForm(context),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(), // Footer at the bottom
    );
  }

  Future<void> _loadImage() async {
    // Simulate a delay for loading the image.
    await Future.delayed(const Duration(seconds: 1));
    // Additional logic to validate image loading can be included here if needed.
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
      height: 450, // Fixed height for the form
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField('Name', false),
          const SizedBox(height: 16),
          _buildTextField('Email', true),
          const SizedBox(height: 16),
          _buildTextField('Message', false, maxLines: 5),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle form submission logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 143, 143, 143), // Button color
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, bool isEmail, {int maxLines = 1}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.blueGrey.shade50,
      ),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      maxLines: maxLines,
    );
  }
}
