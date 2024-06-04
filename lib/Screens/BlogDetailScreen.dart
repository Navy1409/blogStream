import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class BlogDetailScreen extends StatelessWidget {
  static const routeName = '/blog-detail';
  final DocumentSnapshot blogPost;

  BlogDetailScreen({required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A3A3A).withOpacity(.5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(blogPost['tittle'].toString().toUpperCase()),
        backgroundColor: Color(0xFF3A3A3A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                blogPost['image'],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              blogPost['tittle'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A3A3A),
                letterSpacing: 1.2,
                wordSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              blogPost['content'],
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}