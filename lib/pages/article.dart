import 'package:flutter/material.dart';
import 'package:kg_opinion/components/footer.dart';
import 'package:kg_opinion/components/blog_post_card.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for blog posts categorized by topics
    final Map<String, List<BlogPostCard>> categories = {
      'Space': [
        const BlogPostCard(
          title: 'Exploring the Universe',
          summary: 'An in-depth look at the vastness of space...',
          datePublished: '1st Jan 2024',
          authorName: 'AstroGeek',
          imageUrl: 'assets/images/space.png',
        ),
        const BlogPostCard(
          title: 'Mars Exploration',
          summary: 'The journey to Mars is just the beginning...',
          datePublished: '15th Feb 2024',
          authorName: 'SpaceExplorer',
          imageUrl: 'assets/images/space.png',
        ),
      ],
      'Programming': [
        const BlogPostCard(
          title: 'Flutter for Beginners',
          summary: 'Getting started with mobile development...',
          datePublished: '10th Mar 2024',
          authorName: 'CodeMaster',
          imageUrl: 'assets/images/programing.png',
        ),
        const BlogPostCard(
          title: 'Mastering Python',
          summary: 'Unlocking the potential of Python programming...',
          datePublished: '22nd Mar 2024',
          authorName: 'PyGuru',
          imageUrl: 'assets/images/programing.png',
        ),
      ],
      'Biology': [
        const BlogPostCard(
          title: 'Genetics 101',
          summary: 'Understanding the basics of genetics...',
          datePublished: '3rd Apr 2024',
          authorName: 'BioNerd',
          imageUrl: 'assets/images/biology.png',
        ),
      ],
      'Chemistry': [
        const BlogPostCard(
          title: 'Chemical Reactions Simplified',
          summary: 'An easy guide to chemical reactions...',
          datePublished: '12th May 2024',
          authorName: 'ChemEnthusiast',
          imageUrl: 'assets/images/chemistry.png',
        ),
      ],
    };

    return Scaffold(
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Page Title
                  Text(
                    'Blog Articles',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                  ),
                  const SizedBox(height: 16),

                  // Categories and Articles
                  ...categories.entries.map((category) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Title
                        Text(
                          category.key,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                        ),
                        const SizedBox(height: 16),

                        // Grid of articles for the category
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: category.value.length,
                          itemBuilder: (context, index) {
                            return category.value[index];
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    );
                  }),
                  const Footer(),
                ],
              ),
              
            ),
          ),          
        ],
      ),
    );
  }
}
