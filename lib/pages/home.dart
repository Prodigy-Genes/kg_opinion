// home.dart
import 'package:flutter/material.dart';
import 'package:kg_opinion/components/blog_post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    BlogPostCard(
                      title: 'First Blog Post',
                      summary: 'This is the summary of the first post.',
                    ),
                    SizedBox(height: 20),
                    BlogPostCard(
                      title: 'Second Blog Post',
                      summary: 'This is the summary of the second post.',
                    ),
                    // Add more BlogPostCard widgets here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
