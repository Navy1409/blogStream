import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'BlogDetailScreen.dart';
class BlogPostTile extends StatelessWidget {
  final DocumentSnapshot blogPost;

  BlogPostTile({required this.blogPost});

  String _clipSummary(String summary, int wordLimit) {
    List<String> words = summary.split(' ');
    if (words.length > wordLimit) {
      words = words.sublist(0, wordLimit);
      return words.join(' ') + '...';
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    String clippedSummary = _clipSummary(blogPost['summary'], 25);

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              blogPost['image'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              blogPost['title'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A3A3A),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              clippedSummary,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogDetailScreen(blogPost: blogPost),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3A3A3A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Read More',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}