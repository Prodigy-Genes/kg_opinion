import 'package:flutter/material.dart';
import 'package:kg_opinion/components/blog_post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for blog posts
    final blogPosts = [
      const BlogPostCard(
        title: 'First Blog Post',
        summary: 'This is the summary of the first post.',
        datePublished: '3rd May 2003',
        authorName: 'prodigygenes',
        imageUrl: 'assets/images/Logo.jpg',
      ),
      const BlogPostCard(
        title: 'Second Blog Post',
        summary: 'This is the summary of the second post.',
        datePublished: '10th June 2003',
        authorName: 'authorname',
        imageUrl: 'assets/images/Logo.jpg',
      ),
      const BlogPostCard(
        title: 'Third Blog Post',
        summary: 'This is the summary of the third post.',
        datePublished: '15th July 2003',
        authorName: 'authorname',
        imageUrl: 'assets/images/Logo.jpg',
      ),
      const BlogPostCard(
        title: 'Fourth Blog Post',
        summary: 'This is the summary of the fourth post.',
        datePublished: '25th August 2003',
        authorName: 'authorname',
        imageUrl: 'assets/images/Logo.jpg',
      ),
      const BlogPostCard(
        title: 'Fourth Blog Post',
        summary: 'This is the summary of the fourth post.',
        datePublished: '25th August 2003',
        authorName: 'authorname',
        imageUrl: 'assets/images/Logo.jpg',
      ),
      // More blog posts can be added here
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Latest Posts Section
              Text(
                'Latest Posts',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28,
                    ),
              ),
              const SizedBox(height: 20),
              // Display latest posts in grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Prevent scrolling in GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75, // Adjust for card aspect ratio
                ),
                itemCount: blogPosts.length,
                itemBuilder: (context, index) {
                  return blogPosts[index];
                },
              ),
              const SizedBox(height: 40),
              // All Posts Section
              Text(
                'All Posts',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28,
                    ),
              ),
              const SizedBox(height: 20),
              // Display all posts in grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Prevent scrolling in GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75, // Adjust for card aspect ratio
                ),
                itemCount: blogPosts.length,
                itemBuilder: (context, index) {
                  return blogPosts[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
