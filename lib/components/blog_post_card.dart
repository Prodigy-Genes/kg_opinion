import 'package:flutter/material.dart';

class BlogPostCard extends StatelessWidget {
  final String title;
  final String summary;
  final String imageUrl;
  final String datePublished;
  final String authorName;

  const BlogPostCard({
    super.key,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.datePublished,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 18,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image at the top
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/Logo.jpg', // Add a local placeholder image
              image: imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 300),
            ),
          ),
          // Content below the image
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 69),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  summary,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 16),
                // Date and Author
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      datePublished,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                    ),
                    Text(
                      'By $authorName',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white54,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
