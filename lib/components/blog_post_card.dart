// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BlogPostCard extends StatefulWidget {
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
  _BlogPostCardState createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  final ValueNotifier<double> _scaleNotifier = ValueNotifier(1.0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _scaleNotifier.value = 1.05,
      onExit: (_) => _scaleNotifier.value = 1.0,
      child: ValueListenableBuilder<double>(
        valueListenable: _scaleNotifier,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            alignment: Alignment.center,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image at the top, filling the entire allocated height
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: SizedBox(
                      height: 200, // Set a fixed height for the image
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/Logo.jpg', // Local placeholder image
                        image: widget.imageUrl,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 300),
                      ),
                    ),
                  ),
                  // Content below the image
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                            widget.title,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.summary,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                            overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                            maxLines: 3, // Limit number of lines
                          ),
                          const SizedBox(height: 16),
                          // Date and Author
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.datePublished,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white54,
                                      fontSize: 14,
                                    ),
                              ),
                              Text(
                                'By ${widget.authorName}',
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scaleNotifier.dispose();
    super.dispose();
  }
}
