import 'package:flutter/material.dart';
import 'package:kg_opinion/components/blog_post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KgOpinion Blog'),
      ),
      body: ListView(
        children: const [
          BlogPostCard(title: 'First Blog Post', summary: 'This is the summary of the first post.'),
          BlogPostCard(title: 'Second Blog Post', summary: 'This is the summary of the second post.'),
          // Add more BlogPostCard widgets here
        ],
      ),
    );
  }
}
