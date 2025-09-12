import 'package:flutter/material.dart';

class BlogDetailPage extends StatelessWidget {
  final String blogId;

  const BlogDetailPage({
    super.key,
    required this.blogId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Blog Post: $blogId',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          const Text(
            'Blog post content will be displayed here.',
          ),
        ],
      ),
    );
  }
}
