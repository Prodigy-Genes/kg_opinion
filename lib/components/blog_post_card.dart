import 'package:flutter/material.dart';
import 'package:kg_opinion/pages/article.dart';

class BlogPostCard extends StatelessWidget {
  final String title;
  final String summary;

  const BlogPostCard({super.key, required this.title, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(summary),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticlePage(
                title: title,
                content: 'Full content of $title here.',
              ),
            ),
          );
        },
      ),
    );
  }
}
